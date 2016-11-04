//
//  JCF_TableViewControllerManager.m
//  iOSAdapterCellController_OC
//
//  Created by jing on 16/11/1.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "JCF_TableViewControllerManager.h"
@implementation JCF_TableViewControllerManager
//初始化
//初始化
+ (JCF_TableViewDelegateAndDataSource *)createdTableViewByFrame:(CGRect)tableFrame
                       AndCellIndentiful:(NSString *)cellViewIndentiful
                           AndDataSource:(NSMutableArray *)dataSourceArray
                            AndCellClass:(Class)cellClass
                     AndCreatedCellBlock:(CellBlock)createdCellBlock
                 AndDidSelectedCellBlock:(CellBlock)didSelectedCellBlock
                   AndTableviewInitBlock:(TableviewInitBlock)tableviewInitBlock
                      AndCellHeightBlock:(CellHeightBlock)cellHeightBlock
                         AndModelByIndex:(ModelByIndex)modelByindex{
    /*
     *下面可以对block frame 等做一个统一的处理。（按照自己的需求）
     *原理是装饰者模式
     */
    
    //初始化tableviewcontroller
    JCF_TableViewDelegateAndDataSource *controller = [[JCF_TableViewDelegateAndDataSource alloc] init];
    controller.tableFrame = tableFrame;
    controller.cellViewIndentiful = cellViewIndentiful;
    controller.dataSourceArray = dataSourceArray;
    controller.cellClass = cellClass;
    controller.createdCellBlock = createdCellBlock;
    controller.didSelectedCellBlock = didSelectedCellBlock;
    controller.tableviewInitBlock = tableviewInitBlock;
    controller.cellHeightBlock = cellHeightBlock;
    controller.modelByindex = modelByindex;
    return controller;
    
}




@end
