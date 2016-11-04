//
//  People.m
//  iOSAdapterCellController_OC
//
//  Created by jing on 16/11/1.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "People.h"

@implementation People
+(NSMutableArray *)PeopleAll:(int)count{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<count; i++) {
        People *p = [[People alloc] init];
        p.nameString = [@"小明" stringByAppendingString:[NSString stringWithFormat:@"%d",i]];
        p.age = [@"年龄" stringByAppendingString:[NSString stringWithFormat:@"%d",i]];
        [array addObject:p];
    }
    return array;
}
@end
