//
//  People.h
//  iOSAdapterCellController_OC
//
//  Created by jing on 16/11/1.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject
@property (nonatomic,strong) NSString *nameString;
@property (nonatomic,strong) NSString *age;
//拿到peoplemanager  就是建造者模式
+(NSMutableArray *)PeopleAll:(int)count;
@end
