//
//  JCF_TableViewControllerManager.h
//  iOSAdapterCellController_OC
//
//  Created by jing on 16/11/1.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCF_BlockHeader.h"
#import "JCF_TableViewDelegateAndDataSource.h"

/*
 *createdCellBlock 创建cell
 *didSelectedCellBlock didselected调用
 *tableviewInitBlock tableview init 之后会调用一次
 *cellHeightBlock   heightForRow调用
 */
@interface JCF_TableViewControllerManager : NSObject

@property (nonatomic,readonly)NSArray *dataSourceArray;//数据源


//初始化（单个cell）
+ (JCF_TableViewDelegateAndDataSource *)createdTableViewByFrame:(CGRect)tableFrame
                       AndCellIndentiful:(NSString *)cellViewIndentiful
                           AndDataSource:(NSMutableArray *)dataSourceArray
                            AndCellClass:(Class)cellClass
                     AndCreatedCellBlock:(CellBlock)createdCellBlock
                 AndDidSelectedCellBlock:(CellBlock)didSelectedCellBlock
                   AndTableviewInitBlock:(TableviewInitBlock)tableviewInitBlock
                      AndCellHeightBlock:(CellHeightBlock)cellHeightBlock
                         AndModelByIndex:(ModelByIndex)modelByindex;



////初始化（多个cell）  多个cell  架构要大变  
//+ (JCF_TableViewDelegateAndDataSource *)createdTableViewByFrame:(CGRect)tableFrame
//                                              AndCellIndentiful:(NSString *)cellViewIndentiful
//                                                  AndDataSource:(NSMutableArray *)dataSourceArray
//                                                   AndCellClass:(Class)cellClass
//                                            AndCreatedCellBlock:(CellBlock)createdCellBlock
//                                        AndDidSelectedCellBlock:(CellBlock)didSelectedCellBlock
//                                          AndTableviewInitBlock:(TableviewInitBlock)tableviewInitBlock
//                                             AndCellHeightBlock:(CellHeightBlock)cellHeightBlock
//                                                AndModelByIndex:(ModelByIndex)modelByindex;

//设置组试图啥的 加个block 回调就可以 思路都是一样的










@end
