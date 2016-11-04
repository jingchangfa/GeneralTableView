//
//  CalculatorBase.m
//  iOSAdapterCellController_OC
//
//  Created by jing on 16/11/1.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "JCF_CalculatorBase.h"
#import <UIKit/UIKit.h>

@implementation JCF_CalculatorBase
- (instancetype)initWithDataSource:(NSMutableArray *)modelsArray{
    self = [super init];
    if (self) {
        _dataSourceArray = modelsArray;
    }
    return self;
}

- (NSInteger)tableNumberOfSections{
    if([self isOneSelection:self.dataSourceArray]){
        return 1;
    }
    return self.dataSourceArray.count;
}
- (NSInteger)tableNumberOfRowsInSection:(NSInteger)section{
    if([self isOneSelection:self.dataSourceArray]){
        return  self.dataSourceArray.count;
    }
    return ((NSArray *)self.dataSourceArray[section]).count;
}

- (NSObject *)tableModelByIndex:(NSIndexPath *)indexPath{
    if([self isOneSelection:self.dataSourceArray]){
        return self.dataSourceArray[indexPath.row];
    }
    return self.dataSourceArray[indexPath.section][indexPath.row];
}


//辅助方法
- (BOOL)isOneSelection:(NSArray *)models{//是否一个组
    if(models.count<1) return YES;
    if ([((NSObject *)models[0]).class isSubclassOfClass:[NSMutableArray class]]) {
        return NO;
    }else{
        return YES;
    }
}


@end
