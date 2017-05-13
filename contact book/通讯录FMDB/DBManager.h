//
//  DBManager.h
//  通讯录FMDB
//
//  Created by Mikez on 2017/5/4.
//  Copyright © 2017年 Mikez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "Person.h"
@interface DBManager : NSObject
@property (nonatomic, strong)FMDatabase *db;
+ (DBManager *)shareManager;

- (void)insertPerson:(Person *)person;

- (void)deletePerson:(Person *)person;

- (void)updatePerson:(Person *)person;

- (NSMutableArray *)queryPersons;


@end
