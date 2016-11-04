//
//  JCF_TableViewDelegateAndDataSource.h
//  iOSAdapterCellController_OC
//
//  Created by jing on 16/11/1.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JCF_BlockHeader.h"
//所有设计模式的核心基本都是父类指针指向子类对象
//此处可以用策略模式 将 返回row 和section的 逻辑分离开来  

@interface JCF_TableViewDelegateAndDataSource : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,readonly)UITableView *tableView;
//tableview 相关
@property (nonatomic)CGRect tableFrame;
@property (nonatomic,copy)TableviewInitBlock tableviewInitBlock;
@property (nonatomic,strong)NSString *cellViewIndentiful;
@property (nonatomic,strong)NSMutableArray *dataSourceArray;

@property (nonatomic)Class cellClass;
//cellblock相关
@property (nonatomic,copy)CellBlock createdCellBlock;
@property (nonatomic,copy)CellBlock didSelectedCellBlock;//点击事件
@property (nonatomic,copy)CellHeightBlock cellHeightBlock;

//设置  获取data的逻辑 不设置 则按照默认的 来
@property (nonatomic,copy)ModelByIndex modelByindex;



@end
