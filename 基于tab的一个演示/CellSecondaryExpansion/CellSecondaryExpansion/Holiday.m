//
//  Holiday.m
//  CellSecondaryExpansion
//
//  Created by jing on 16/11/4.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "Holiday.h"

@implementation Holiday
-(instancetype)init{
    self = [super init];
    if (self) {
        self.title = @"泰国玩";
        self.detail = [Day days];
    }
    return self;
}

@end
