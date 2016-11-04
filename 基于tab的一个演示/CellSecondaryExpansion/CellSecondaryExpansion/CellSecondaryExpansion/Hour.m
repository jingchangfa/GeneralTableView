//
//  Hour.m
//  CellSecondaryExpansion
//
//  Created by jing on 16/11/4.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "Hour.h"

@implementation Hour
+ (NSArray <Hour *>*)hoursByTag:(int)tag{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<tag; i++) {
        Hour *hour = [[Hour alloc] init];
        hour.text = [NSString stringWithFormat:@"hour：%d",i];
        hour.time = [NSString stringWithFormat:@"0%d:01",i];
        [array addObject:hour];
    }
    return array;
}


@end
