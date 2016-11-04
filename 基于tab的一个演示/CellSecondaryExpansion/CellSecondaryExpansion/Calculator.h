//
//  Calculator.h
//  CellSecondaryExpansion
//
//  Created by jing on 16/11/4.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <JCF_CalculatorBase.h>
#import "Holiday.h"

@interface Calculator : JCF_CalculatorBase
@property (nonatomic,strong)NSArray *indexArray;

//此方法计算 rowheight
- (float)getTheRowHeightByModel:(Hour *)hour;
@end
