# UniversaSlimpleTableview
tableview的一个简单的封装，一句代码创建tableview不用每次都实现坑爹的delegate

# 添加了组头尾视图的支持，新增reloadDateByArray 方法用来reloaddata
# 添加了对多种cell的支持，重写了架构，现在的看起来顺眼多了，小伙伴们可以对照前后，感受一下区别
### pod
```
pod 'GeneralTableView', '~> 0.1.0'
pod search GeneralTableView
-> GeneralTableView (0.1.0)
   tableview的一个封装
   pod 'GeneralTableView', '~> 0.1.0'
   - Homepage: https://github.com/jingchangfa/GeneralTableView
   - Source:   https://github.com/jingchangfa/GeneralTableView.git
   - Versions: 0.1.0 [master repo]
```
### 使用如下
```
@property (nonatomic,strong)JCF_TabelAgreement *tabNewanager;


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
```
### 更新数据源
```
    //reload data
    array = [NSMutableArray arrayWithArray:@[[People PeopleAll:10],[People PeopleAll:10]]];
    [self.tabNewanager reloadDateByArray:array];
```
[23种设计模式笔记(未完)_简书的地址](http://www.jianshu.com/users/bb97e9208c57/latest_articles)
### 虽然用的java 思想都是一样的
### --------------------分割线----------------------------


