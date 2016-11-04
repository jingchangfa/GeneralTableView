//
//  ViewController.m
//  CellSecondaryExpansion
//
//  Created by jing on 16/11/4.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "ViewController.h"
#import <JCF_TabelAgreement.h>
#import "Holiday.h"
#import "CustomCell.h"
#import "Calculator.h"
#import "HeaderView.h"

@interface ViewController ()
@property (nonatomic,strong)Holiday *holidayModel;
@property (nonatomic,strong)JCF_TabelAgreement *tableViewManager;
@property (nonatomic,strong)NSMutableArray *tapArray;;
@property (nonatomic,strong)Calculator *calculator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableview];
    [self getModel];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)getModel{
    self.holidayModel = [[Holiday alloc] init];
    [self.tableViewManager reloadDateByArray:self.holidayModel.detail];
}
- (void)initTableview{
    __weak typeof(self) weakSelf = self;
    self.tableViewManager.tableFrame = CGRectMake(0, 20, 375, 657);
    self.tableViewManager.calculator = self.calculator;
    [self.tableViewManager addCellClass:[CustomCell class] ByModelClass:[Hour class]];
    [self.tableViewManager addHeadViewClass:[HeaderView class] ByModelClass:[Day class]];

    
    self.tableViewManager.dataSourceArray = self.holidayModel.detail;
    [self.tableViewManager setTableviewInitBlock:^(UITableView *tablewView) {
        //添加头尾 上啦 下啦 啥的
//        tablewView.backgroundColor = [UIColor redColor];
        tablewView.showsVerticalScrollIndicator = NO;
        tablewView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }];
    [self.tableViewManager setCreatedCellBlock:^(NSObject *model, UITableViewCell *cell, NSIndexPath *indexPath) {
        Hour *hour = (Hour *)model;
        CustomCell *cusCell = (CustomCell *)cell;
        cusCell.nameLabel.text = hour.text;
        cusCell.ageLabel.text = hour.time;
    }];
    [self.tableViewManager setCellHeightBlock:^float(NSObject *model, NSIndexPath *indexPath) {
        Hour *hour = (Hour *)model;
        //你需要自己算
        return [weakSelf.calculator getTheRowHeightByModel:hour];
    }];
    [self.tableViewManager setCellHeadViewHeightInSectionBlock:^float(NSInteger section,NSObject *model) {
        return 40;
    }];
    [self.tableViewManager setCellHeadeViewInSectionBlock:^(UITableViewHeaderFooterView *view, NSInteger section, NSObject *model) {
        Day *day = (Day *)model;
        HeaderView *headView = (HeaderView *)view;
        headView.frame = CGRectMake(0, 0, 375, 40);
        headView.label.frame = headView.bounds;
        headView.label.text = day.howDay;
        headView.label.textAlignment = NSTextAlignmentCenter;
        headView.label.backgroundColor = [UIColor grayColor];
        headView.label.tag = section;
    }];
    [self.tableViewManager setHeaderViewInitBlcok:^(UITableViewHeaderFooterView *view, NSInteger section, NSObject *model) {
        //来添加点击事件之类的方法
        HeaderView *headView = (HeaderView *)view;
        [weakSelf addTapByLabel:headView.label];
    }];
    
    [self.view addSubview:self.tableViewManager.tableView];
}
- (void)addTapByLabel:(UILabel *)label{
    label.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [label addGestureRecognizer:tap];
}
- (void)tapAction:(UITapGestureRecognizer *)tap{
    if ([self.tapArray containsObject:@(tap.view.tag)]) {
        [self.tapArray removeObject:@(tap.view.tag)];
    }else{
        [self.tapArray addObject:@(tap.view.tag)];
    }
    [self.tableViewManager reloadDateByArray:self.holidayModel.detail];
}
- (JCF_TabelAgreement *)tableViewManager{
    if (!_tableViewManager) {
        _tableViewManager = [[JCF_TabelAgreement alloc] init];
    }
    return _tableViewManager;
}
-(NSMutableArray *)tapArray{
    if (!_tapArray) {
        _tapArray = [NSMutableArray array];
    }
    return _tapArray;
}
-(Calculator *)calculator{
    if (!_calculator) {
        _calculator = [[Calculator alloc] initWithDataSource:self.holidayModel.detail];
        _calculator.indexArray = self.tapArray;
    }
    return _calculator;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
