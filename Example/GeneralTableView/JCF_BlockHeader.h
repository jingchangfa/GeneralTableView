//
//  JCF_BlockHeader.h
//  iOSAdapterCellController_OC
//
//  Created by jing on 16/11/1.
//  Copyright © 2016年 jing. All rights reserved.
//

#ifndef JCF_BlockHeader_h
#define JCF_BlockHeader_h
#import <UIKit/UIKit.h>
/**
 负责管理 tablecontroller
 1. 创建tablecontroller
 2. 给collection赋值
 3. block回调 cell的创建
 4. cell点击事件
 5. 如何预留table的扩展性呢？（初始化的时候讲tableview的实例对象回调回去）
 */

typedef void(^CellBlock)(NSObject *model,UITableViewCell *cell,NSIndexPath *indexPath);
//tableview init 之后会调用一次（可以设置头尾以及上啦下拉）
typedef void(^TableviewInitBlock)(UITableView *tablewView);
//此block 返回cell的高度 用于动态计算cell高度
typedef float(^CellHeightBlock)(NSObject *model,NSIndexPath *indexPath);//JCF_TableViewBaseCell *cell,
//根据index获取model的逻辑, 不写则按照 默认的来
typedef NSObject*(^ModelByIndex)(NSArray *models,NSIndexPath *indexPath);
//返回 头尾试图的block
typedef UIView *(^HeaderFootViewBySection)(NSInteger section);
//返回头尾试图的高度
typedef float(^HeaderFootViewHeightBlock)(NSInteger section);

#endif /* JCF_BlockHeader_h */
