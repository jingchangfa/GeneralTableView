//
//  Holiday.h
//  CellSecondaryExpansion
//
//  Created by jing on 16/11/4.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Day.h"
@interface Holiday : NSObject
@property (nonatomic,strong) NSString *ID;
@property (nonatomic,strong) NSString *tour_id;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *des;
@property (nonatomic,strong) NSString *img;
@property (nonatomic,strong) NSString *total_days;
@property (nonatomic,strong) NSString *sdate;
@property (nonatomic,strong) NSString *edate;

@property (nonatomic,strong) NSArray<Day *> *detail;

-(instancetype)init;
@end
