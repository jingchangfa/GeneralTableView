//
//  JCF_TabelAgreement.m
//  iOSAdapterCellController_OC
//
//  Created by jing on 16/11/1.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "JCF_TabelAgreement.h"
@implementation JCF_TabelAgreement

-(instancetype)init{
    self = [super init];
    if (self) {
        //貌似没啥需要做的
    }
    return self;
}
- (void)addCellClass:(Class)cellClass ByModelClass:(Class)modelClass{
    [self.mapping addCellClass:cellClass ByModelClass:modelClass];
}

- (void)addFootViewClass:(Class)footClass ByModelClass:(Class)modelClass{
    [self.mapping addFootViewClass:footClass ByModelClass:modelClass];
}
- (void)addHeadViewClass:(Class)headClass ByModelClass:(Class)modelClass{
    [self.mapping addHeadViewClass:headClass ByModelClass:modelClass];
}

- (void)reloadDateByArray:(NSMutableArray *)datasArray{
    self.dataSourceArray = datasArray;
    self.calculator.dataSourceArray = datasArray;
    [self.tableView reloadData];
}
#pragma mark  Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.calculator tableNumberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.calculator tableNumberOfRowsInSection:section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSObject *model = [self.calculator tableModelByIndex:indexPath];
    //不设置会崩溃
    if (self.cellHeightBlock) return self.cellHeightBlock(model,indexPath);
    return 0.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSObject *model = [self.calculator tableModelByIndex:indexPath];
    NSString *indentifulString = [self.mapping indentifulByModel:model];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifulString];
    if (!cell) {
        cell = [[[self.mapping tableCellClassByModel:model] alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifulString];
        if (self.cellInitBlcok) self.cellInitBlcok(model,cell,indexPath);
    }
    //设置cell
    if (self.createdCellBlock) self.createdCellBlock(model,cell,indexPath);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSObject *model = [self.calculator tableModelByIndex:indexPath];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (self.didSelectedCellBlock) self.didSelectedCellBlock(model,cell,indexPath);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(self.cellHeadViewHeightInSectionBlock)return self.cellHeadViewHeightInSectionBlock(section,[self.calculator tableSectionModelBySection:section]);
    return 0.0f;
}
//添加重用机制
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSObject *model = [self.calculator tableSectionModelBySection:section];
    NSString *indentifulString = [NSString stringWithFormat:@"%@HeaderView",[self.mapping indentifulByModel:model]];
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:indentifulString];
    if (!headerView) {
        headerView = [[[self.mapping tableHeadClassByModel:model] alloc] initWithReuseIdentifier:indentifulString];
        if (self.headerViewInitBlcok) {
            self.headerViewInitBlcok(headerView,section,[self.calculator tableSectionModelBySection:section]);
        }
    }
    if(self.cellHeadeViewInSectionBlock) self.cellHeadeViewInSectionBlock(headerView,section,[self.calculator tableSectionModelBySection:section]);
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if(self.cellFootViewHeightInSectionBlock)return self.cellFootViewHeightInSectionBlock(section,[self.calculator tableSectionModelBySection:section]);
    return 0.0f;
}
//添加重用机制
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    NSObject *model = [self.calculator tableSectionModelBySection:section];
    NSString *indentifulString = [NSString stringWithFormat:@"%@FootView",[self.mapping indentifulByModel:model]];
    UITableViewHeaderFooterView *footView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:indentifulString];
    if (!footView) {
        footView = [[[self.mapping tableFootClassByModel:model] alloc] initWithReuseIdentifier:indentifulString];
        if (self.footViewInitBlcok) {
            self.footViewInitBlcok(footView,section,[self.calculator tableSectionModelBySection:section]);
        }
    }
    if(self.cellHeadeViewInSectionBlock) self.cellHeadeViewInSectionBlock(footView,section,[self.calculator tableSectionModelBySection:section]);
    return footView;
}


#pragma mark  SET
-(void)setDataSourceArray:(NSMutableArray *)dataSourceArray{
    _dataSourceArray = dataSourceArray;
    self.calculator.dataSourceArray = dataSourceArray;//更新一个 辅助 的数据源
}
-(void)setTableView:(UITableView *)tableView{
    if (tableView) {
        _tableView = tableView;
        if(self.tableviewInitBlock) self.tableviewInitBlock(_tableView);
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
}
-(void)setTableFrame:(CGRect)tableFrame{
    _tableFrame = tableFrame;
}
#pragma mark  get
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.tableFrame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        if(self.tableviewInitBlock) self.tableviewInitBlock(_tableView);
    }
    return _tableView;
}
-(JCF_CalculatorBase *)calculator{//不设置就是默认的
    if (!_calculator) {
        _calculator = [[JCF_CalculatorBase alloc] initWithDataSource:self.dataSourceArray];
    }
    return _calculator;
}
-(JCF_ModelViewMapping *)mapping{
    if (!_mapping) {
        _mapping = [[JCF_ModelViewMapping alloc] init];
    }
    return _mapping;
}
@end
