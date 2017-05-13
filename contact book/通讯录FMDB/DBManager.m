//
//  DBManager.m
//  通讯录FMDB
//
//  Created by Mikez on 2017/5/4.
//  Copyright © 2017年 Mikez. All rights reserved.
//

#import "DBManager.h"
static DBManager *_manager;
@implementation DBManager
+(DBManager *)shareManager{
    
    if (!_manager) {
        _manager = [DBManager new];
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/persons.db"];
        _manager.db = [FMDatabase databaseWithPath:path];
        
        if ([_manager.db open]) {
            NSLog(@"打开数据库文件成功");
            
            
            if ([_manager.db executeUpdate:@"create table if not exists persons (name text,code text, pid integer primary key autoincrement)"]) {
                NSLog(@"创建表成功！");
            }else NSLog(@"创建表失败");
            
            
        }
        
    }
    
    return _manager;
}

-(void)insertPerson:(Person *)person{
    
    NSString *sql = [NSString stringWithFormat:@"insert into persons (name, code) values ('%@','%@')",person.name,person.code];
    if ([self.db executeUpdate:sql]) {
        NSLog(@"插入数据成功！");
    }else NSLog(@"插入数据失败");
    
}
-(void)deletePerson:(Person *)person{
    
    NSString *sql = [NSString stringWithFormat:@"delete from persons where pid=%d",person.pid];
    if ([self.db executeUpdate:sql]) {
        NSLog(@"删除数据成功！");
    }else NSLog(@"删除数据失败！");
    
}
-(void)updatePerson:(Person *)person{
    
    NSString *sql = [NSString stringWithFormat:@"update persons set name='%@', code='%@' where pid=%d",person.name,person.code,person.pid];
    
    
    if ([self.db executeUpdate:sql]) {
        NSLog(@"修改数据成功！");
    }else NSLog(@"修改数据失败！");
    
}

-(NSMutableArray *)queryPersons{
    
    
    
    NSMutableArray *persons = [NSMutableArray array];
    
    FMResultSet *result = [self.db executeQuery:@"select * from persons"];
    while ([result next]) {
        Person *p = [Person new];
        
        p.name = [result stringForColumn:@"name"];
        p.code = [result stringForColumn:@"code"];
        p.pid = [result intForColumn:@"pid"];
        
        [persons addObject:p];
    }
    
    return  persons;
    
}
@end
