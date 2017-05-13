//
//  Person.h
//  通讯录
//
//  Created by Mikez on 2017/5/4.
//  Copyright © 2017年 Mikez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic)int pid;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *code;
@end
