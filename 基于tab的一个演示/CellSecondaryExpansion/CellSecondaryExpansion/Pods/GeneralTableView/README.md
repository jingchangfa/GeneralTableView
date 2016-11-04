# UniversaSlimpleTableview
tableview的一个简单的封装，一句代码创建tableview不用每次都实现坑爹的delegate

# 添加了组头尾视图的支持，新增reloadDateByArray 方法用来reloaddata
# 添加了对多种cell的支持，重写了架构，现在的看起来顺眼多了，小伙伴们可以对照前后，感受一下区别
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

# 下面的那些废话可以无视了～好奇的也可以看看 以前的代码是咋写的～～～
------------------我是分割线（下面的是老的,定制程度太高了）------------------------------
### 首先你需要,添加为属性
```
@interface ViewController ()
@property (nonatomic,strong)JCF_TableViewDelegateAndDataSource *tableController;
@end
```
### 然后创建，tableview
```
NSMutableArray *array = [People PeopleAll:10];
    CGRect frame = CGRectMake(0, 20, 375, 500);
    //支持 数组 套数组
    //    array = [NSMutableArray arrayWithArray:@[[People PeopleAll:10],[People PeopleAll:10]]];
    self.tableController = [JCF_TableViewControllerManager createdTableViewByFrame:frame AndCellIndentiful:@"HI" AndDataSource:array AndCellClass:[CustomCell class] AndCreatedCellBlock:^(NSObject *model, JCF_TableViewBaseCell *cell, NSIndexPath *indexPath) {
        //cell 赋值
        People *p = (People *)model;
        CustomCell *cuscell = (CustomCell *)cell;
        cuscell.nameLabel.text = p.nameString;
        cuscell.ageLabel.text = p.age;
    } AndDidSelectedCellBlock:^(NSObject *model, JCF_TableViewBaseCell *cell, NSIndexPath *indexPath) {
        //点击事件
        People *p = (People *)model;
        NSLog(@"点击的是 组：%d row %d: 对应的model的name是:%@",(int)indexPath.section,(int)indexPath.row,p.nameString);
        
    } AndTableviewInitBlock:^(UITableView *tablewView) {
        //添加 header 和 foot 啥的
    } AndCellHeightBlock:^float(NSObject *model, NSIndexPath *indexPath) {
        //自己计算cell的高度
        return 40;//高度
    } AndModelByIndex:nil];
```
### 最后，add到你所需要的位置
```
[self.view addSubview: self.tableController.tableView];
```
### 如果你需要reloadData的话
```
[self.tableController.tableView reloadData];
``` 

### JCF_TableViewDelegateAndDataSource都返回了(这样感觉很不好)，没什么做不得了。。
### 来源,最近看了看java的23种设计模式,有感而发，只是最初版，可以优化的地方很多很多，例如支持多种cell，等～～
[23种设计模式笔记(未完)_简书的地址](http://www.jianshu.com/users/bb97e9208c57/latest_articles)
### 虽然用的java 思想都是一样的
### 如果你要有兴趣，希望可以提携我一下
### --------------------分割线----------------------------
#### 关于多个cell的实现思路
1. 建立个model与cell的映射关系
2. 返回cell的delegate方法根据model的class创建对应的cell
3. block将cell的class也返回

