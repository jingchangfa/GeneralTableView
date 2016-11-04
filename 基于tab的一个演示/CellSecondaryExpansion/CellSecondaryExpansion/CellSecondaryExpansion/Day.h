//
//  Day.h
//  CellSecondaryExpansion
//
//  Created by jing on 16/11/4.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hour.h"
@interface Day : NSObject
@property (nonatomic,strong) NSString *data;
@property (nonatomic,strong) NSString *howDay;
@property (nonatomic,strong) NSArray<Hour *> *content;
+ (NSArray <Day *> *)days;
@end
