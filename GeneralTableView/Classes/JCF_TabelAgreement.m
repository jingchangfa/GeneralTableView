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
    if (!self.classDictionary) {
        self.classDictionary = [NSMutableDictionary dictionary];
    }
    NSString *modelClassString = NSStringFromClass(modelClass);
    NSString *cellClassString = NSStringFromClass(cellClass);
    self.classDictionary[modelClassString] = cellClassString;
}
- (void)reloadDateByArray:(NSMutableArray *)datasArray{
    self.dataSourceArray = datasArray;
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
    NSString *indentifulString = [self indentifulByModel:model];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifulString];
    if (!cell) {
        cell = [[[self tableCellClassByModel:model] alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifulString];
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
    if(self.cellHeadViewHeightInSectionBlock)return self.cellHeadViewHeightInSectionBlock(section);
    return 0.0f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(self.cellHeadeViewInSectionBlock)return self.cellHeadeViewInSectionBlock(section);
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if(self.cellFootViewHeightInSectionBlock)return self.cellFootViewHeightInSectionBlock(section);
    return 0.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if(self.cellFootViewInSectionBlock)return self.cellFootViewInSectionBlock(section);
    return nil;
}

#pragma mark  辅助方法
- (Class)tableCellClassByModel:(NSObject *)model{
    //根据model的class 找对应的 cell的class
    if (!self.classDictionary) {
        return [UITableViewCell class];
    }
    NSString *modelClassString = NSStringFromClass(model.class);
    NSString *cellClassString = self.classDictionary[modelClassString];
    if (!cellClassString) return [UITableViewCell class];
    Class cellClass = NSClassFromString(cellClassString);
    return cellClass;
}
- (NSString *)indentifulByModel:(NSObject *)model{
    //根据model的class 生成cell的indentiful
    return NSStringFromClass(model.class);
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
@end
