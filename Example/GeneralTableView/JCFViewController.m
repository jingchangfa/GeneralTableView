//
//  JCFViewController.m
//  GeneralTableView
//
//  Created by jing on 11/04/2016.
//  Copyright (c) 2016 jing. All rights reserved.
//

#import "JCFViewController.h"
#import "People.h"
#import "CustomCell.h"
#import "JCF_TableViewControllerManager.h"//old
#import "JCF_TabelAgreement.h"//new
@interface JCFViewController ()
@property (nonatomic,strong)JCF_TabelAgreement *tabNewanager;
@property (nonatomic,strong)JCF_TableViewDelegateAndDataSource *tabOldManager;
@end

@implementation JCFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self newTableView];
}
- (void)newTableView{
    NSMutableArray *array = [People PeopleAll:10];
    CGRect frame = CGRectMake(0, 20, 375, 500);
    self.tabNewanager = [[JCF_TabelAgreement alloc] init];
    [self.tabNewanager addCellClass:[CustomCell class] ByModelClass:[People class]];
    self.tabNewanager.tableFrame = frame;
    self.tabNewanager.dataSourceArray = array;
    //三个cell block
    [self.tabNewanager setTableviewInitBlock:^(UITableView *tablewView) {
        //自己处理  比如设置 背景色 边框 头 尾 啥的
    }];
    [self.tabNewanager setCreatedCellBlock:^(NSObject *model, UITableViewCell *cell, NSIndexPath *indexPath) {
        //cell 赋值
        People *p = (People *)model;
        CustomCell *cuscell = (CustomCell *)cell;
        cuscell.nameLabel.text = p.nameString;
        cuscell.ageLabel.text = p.age;
    }];
    [self.tabNewanager setDidSelectedCellBlock:^(NSObject *model, UITableViewCell *cell, NSIndexPath *indexPath) {
        //点击事件
        People *p = (People *)model;
        NSLog(@"点击的是 组：%d row %d: 对应的model的name是:%@",(int)indexPath.section,(int)indexPath.row,p.nameString);
    }];
    [self.tabNewanager setCellHeightBlock:^float(NSObject *model, NSIndexPath *indexPath) {
        return 40;
    }];
    [self.view addSubview:self.tabNewanager.tableView];
    
    //reload data
    array = [NSMutableArray arrayWithArray:@[[People PeopleAll:10],[People PeopleAll:10]]];
    [self.tabNewanager reloadDateByArray:array];
}
- (void)oldTableView{
    NSMutableArray *array = [People PeopleAll:10];
    CGRect frame = CGRectMake(0, 20, 375, 500);
    //    array = @[];
    //支持 数组 套数组
    //    array = [NSMutableArray arrayWithArray:@[[People PeopleAll:10],[People PeopleAll:10]]];
    //一定要定义成属性  否则坑死你～～～～～
    self.tabOldManager = [JCF_TableViewControllerManager createdTableViewByFrame:frame AndCellIndentiful:@"HI" AndDataSource:array AndCellClass:[CustomCell class] AndCreatedCellBlock:^(NSObject *model, UITableViewCell *cell, NSIndexPath *indexPath) {
        //cell 赋值
        People *p = (People *)model;
        CustomCell *cuscell = (CustomCell *)cell;
        cuscell.nameLabel.text = p.nameString;
        cuscell.ageLabel.text = p.age;
        
    } AndDidSelectedCellBlock:^(NSObject *model, UITableViewCell *cell, NSIndexPath *indexPath) {
        //点击事件
        People *p = (People *)model;
        NSLog(@"点击的是 组：%d row %d: 对应的model的name是:%@",(int)indexPath.section,(int)indexPath.row,p.nameString);
        
    } AndTableviewInitBlock:^(UITableView *tablewView) {
        //添加 header 和 foot 啥的
    } AndCellHeightBlock:^float(NSObject *model, NSIndexPath *indexPath) {
        //自己计算cell的高度
        return 40;//高度
    } AndModelByIndex:nil];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview: self.tabOldManager.tableView];
    [self.tabOldManager.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
