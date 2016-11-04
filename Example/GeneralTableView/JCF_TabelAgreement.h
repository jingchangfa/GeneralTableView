//
//  JCF_TabelAgreement.h
//  iOSAdapterCellController_OC
//
//  Created by jing on 16/11/1.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JCF_CalculatorBase.h"
#import "JCF_BlockHeader.h"
/**
 * 可以对比之前和现在，理解一下设计模式，以及有啥优点
 * 版本2
 * 觉的manager 没什么存在的必要了，所以移除了
 *
 */

@interface JCF_TabelAgreement : NSObject<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}
/**
 * 添加cell 和model的对照关系
 * 不实现此方法 会导致 创建的cell总会是 uitableviewcell
 */
//*******此方法要在[view addSubview:JCF_TabelAgreement.tableView];之前********
- (void)addCellClass:(Class)cellClass ByModelClass:(Class)modelClass;

- (void)reloadDateByArray:(NSMutableArray *)datasArray;


/**
 * 可以自定义tableview的样式,默认 请看 get方法
 * 设置tableView的frame
 */
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic)CGRect tableFrame;



/*
 * 默认 识别［model,model］ 和[[model,model],[model,model]] 两种，其余的不识别
 * 特殊需求请自己实现 4个 方法，方法里不要调用［super xxxx］;
 * 自定义计算则 需要继承自 JCF_CalculatorBase 重写协议方法
 */
@property (nonatomic,strong)JCF_CalculatorBase *calculator;
@property (nonatomic,strong)NSMutableArray *dataSourceArray;




/** block
 * tableviewInitBlock   可以设置tab的头尾试图等  (选择实现)
 * createdCellBlock      设置cell内容   (选择实现)
 * didSelectedCellBlock  cell的点击事件 (选择实现)
 * cellHeightBlock       cell的高度调用 (选择实现) 0.0f
 * cellHeadeViewInSectionBlock   设置cell的组头视图 (选择实现) nil
 * cellFootViewInSectionBlock    设置cell的组尾视图 (选择实现) nil
 * cellHeadViewHeightInSectionBlock 组头视图高 (选择实现) 0.0f
 * cellFootViewHeightInSectionBlock 组尾视图高 (选择实现) 0.0f
 */
@property (nonatomic,copy)TableviewInitBlock tableviewInitBlock;
@property (nonatomic,copy)CellBlock createdCellBlock;
@property (nonatomic,copy)CellBlock didSelectedCellBlock;
@property (nonatomic,copy)CellHeightBlock cellHeightBlock;
@property (nonatomic,copy)HeaderFootViewBySection cellHeadeViewInSectionBlock;
@property (nonatomic,copy)HeaderFootViewBySection cellFootViewInSectionBlock;

@property (nonatomic,copy)HeaderFootViewHeightBlock cellHeadViewHeightInSectionBlock;
@property (nonatomic,copy)HeaderFootViewHeightBlock cellFootViewHeightInSectionBlock;




/**
 * 此属性无需设置
 * 通过addCellClass添加内容
 * 为空则代表单一的cell
 * 储存形势：@{@"modelClass":@"cellClass"}
 */
@property (nonatomic,strong)NSMutableDictionary *classDictionary;



//点击生成生成block
-(void)setTableviewInitBlock:(TableviewInitBlock)tableviewInitBlock;
-(void)setCreatedCellBlock:(CellBlock)createdCellBlock;
-(void)setDidSelectedCellBlock:(CellBlock)didSelectedCellBlock;
-(void)setCellHeightBlock:(CellHeightBlock)cellHeightBlock;
-(void)setCellHeadeViewInSectionBlock:(HeaderFootViewBySection)cellHeadeViewInSectionBlock;
-(void)setCellFootViewInSectionBlock:(HeaderFootViewBySection)cellFootViewInSectionBlock;
-(void)setCellHeadViewHeightInSectionBlock:(HeaderFootViewHeightBlock)cellHeadViewHeightInSectionBlock;
-(void)setCellFootViewHeightInSectionBlock:(HeaderFootViewHeightBlock)cellFootViewHeightInSectionBlock;
@end
