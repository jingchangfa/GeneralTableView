//
//  Day.m
//  CellSecondaryExpansion
//
//  Created by jing on 16/11/4.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "Day.h"

@implementation Day
+ (NSArray <Day *> *)days{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<4; i++) {
        Day *day = [[Day alloc] init];
        day.data = [NSString stringWithFormat:@"7月%d号",i];
        day.howDay = [NSString stringWithFormat:@"去玩%d",i];
        day.content = [Hour hoursByTag:i+1];
        [array addObject:day];
    }
    return array;
}

@end
