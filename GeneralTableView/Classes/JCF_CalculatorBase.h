//
//  CalculatorBase.h
//  iOSAdapterCellController_OC
//
//  Created by jing on 16/11/1.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCF_CalculatorProtocol.h"

/*负责计算
 * 1.section
 * 2.row
 * 3.根据index 获取 model
 * 4.根据index 获取 cell   的class
 */
@interface JCF_CalculatorBase : NSObject<JCF_CalculatorProtocol>

//数据源
@property (nonatomic,strong)NSMutableArray *dataSourceArray;

- (instancetype)initWithDataSource:(NSMutableArray *)modelsArray;
@end
