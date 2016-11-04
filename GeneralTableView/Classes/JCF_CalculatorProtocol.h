//
//  JCF_CalculatorProtocol.h
//  iOSAdapterCellController_OC
//
//  Created by jing on 16/11/1.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JCF_CalculatorProtocol <NSObject>
/**
 * tableNumberOfSections  返回Section数目
 * tableNumberOfRowsInSection 返回每Section的row
 * tableModelByIndex 返回indexpatch 对应的model
 */
 
- (NSInteger)tableNumberOfSections;
- (NSInteger)tableNumberOfRowsInSection:(NSInteger)section;
- (NSObject *)tableModelByIndex:(NSIndexPath *)indexPath;

@end
