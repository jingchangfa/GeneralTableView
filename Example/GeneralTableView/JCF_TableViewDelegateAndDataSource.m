//
//  JCF_TableViewDelegateAndDataSource.m
//  iOSAdapterCellController_OC
//
//  Created by jing on 16/11/1.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "JCF_TableViewDelegateAndDataSource.h"
#import "JCF_TableViewBaseCell.h"

@implementation JCF_TableViewDelegateAndDataSource
-(instancetype)init{
    self = [super init];
    if (self) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self section:self.dataSourceArray];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self row:self.dataSourceArray :section];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //不设置会崩溃
    return self.cellHeightBlock(self.modelByindex(self.dataSourceArray,indexPath),indexPath);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCF_TableViewBaseCell *cell = (JCF_TableViewBaseCell *)[tableView dequeueReusableCellWithIdentifier:self.cellViewIndentiful];
    if (!cell) {
        //这里改成动态的
        //        JCF_TableViewBaseCell cellClass = self.cellClass;
        cell = [[self.cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellViewIndentiful];
    }
    //设置cell
    if (self.createdCellBlock) {
        self.createdCellBlock(self.modelByindex(self.dataSourceArray,indexPath),cell,indexPath);
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    JCF_TableViewBaseCell *cell = (JCF_TableViewBaseCell *)[tableView cellForRowAtIndexPath:indexPath];
    if (self.didSelectedCellBlock) self.didSelectedCellBlock(self.modelByindex(self.dataSourceArray,indexPath),cell,indexPath);
}
//若没设置  则默认生成
//下面这俩其实也应该 block带出去
-(NSInteger)section:(NSArray *)models{
    if ([self isOneSelection:models]) {
        return 1;
    }else{
        return models.count;
    }
}
-(NSInteger)row:(NSArray *)models :(NSInteger)section{
    if ([self isOneSelection:models]) {
        return models.count;
    }else{
        return ((NSArray *)models[section]).count;
    }
}
-(ModelByIndex)modelByindex{
    if(!_modelByindex){
        __weak typeof(self)weakself = self;
        _modelByindex = ^(NSArray *models,NSIndexPath *indexPath){
            if ([weakself isOneSelection:models]) {
                return models[indexPath.row];
            }else{
                return models[indexPath.section][indexPath.row];
            }
        };
    }
    return _modelByindex;
}
- (BOOL)isOneSelection:(NSArray *)models{//是否一个组
    if(models.count<1) return YES;
    if ([((NSObject *)models[0]).class isSubclassOfClass:[NSMutableArray class]]) {
        return NO;
    }else{
        return YES;
    }
}
//set方法
-(void)setTableFrame:(CGRect)tableFrame{
    _tableFrame = tableFrame;
    self.tableView.frame = tableFrame;
}
- (void)setTableviewInitBlock:(TableviewInitBlock)tableviewInitBlock{
    _tableviewInitBlock = tableviewInitBlock;
    if (_tableviewInitBlock) {//执行一次
        _tableviewInitBlock(self.tableView);
    }
}
-(void)setDataSourceArray:(NSMutableArray *)dataSourceArray{
    _dataSourceArray = dataSourceArray;
}
//get
-(NSString *)cellViewIndentiful{
    if (!_cellViewIndentiful) {
        _cellViewIndentiful = @"adapterCell";
    }
    return _cellViewIndentiful;
}
-(void)dealloc{
    NSString *sre;
}
@end
