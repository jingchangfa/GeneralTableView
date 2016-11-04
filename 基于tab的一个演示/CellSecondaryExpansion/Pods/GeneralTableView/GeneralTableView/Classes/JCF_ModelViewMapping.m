//
//  JCF_ModelViewMapping.m
//  GeneralTableView
//
//  Created by jing on 16/11/4.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "JCF_ModelViewMapping.h"

@implementation JCF_ModelViewMapping

//添加
- (void)addCellClass:(Class)cellClass ByModelClass:(Class)modelClass{
    NSString *modelClassString = NSStringFromClass(modelClass);
    NSString *cellClassString = NSStringFromClass(cellClass);
    self.classDictionary[modelClassString] = cellClassString;
}
- (void)addFootViewClass:(Class)footClass ByModelClass:(Class)modelClass{
    NSString *modelClassString = NSStringFromClass(modelClass);
    NSString *footClassString = NSStringFromClass(footClass);
    self.footDictionary[modelClassString] = footClassString;
}
- (void)addHeadViewClass:(Class)headClass ByModelClass:(Class)modelClass{
    NSString *modelClassString = NSStringFromClass(modelClass);
    NSString *headClassString = NSStringFromClass(headClass);
    self.headDictionary[modelClassString] = headClassString;
}

#pragma mark  辅助方法
- (NSString *)indentifulByModel:(NSObject *)model{
    //根据model的class 生成cell的indentiful
    return NSStringFromClass(model.class);
}

#pragma mark  辅助方法
- (Class)tableCellClassByModel:(NSObject *)model{
    //根据model的class 找对应的 cell的class
    NSString *modelClassString = NSStringFromClass(model.class);
    NSString *cellClassString = self.classDictionary[modelClassString];
    if (!cellClassString) return [UITableViewCell class];
    Class cellClass = NSClassFromString(cellClassString);
    return cellClass;
}
- (Class)tableFootClassByModel:(NSObject *)model{
    //根据model的class 找对应的 foot的class
    NSString *modelClassString = NSStringFromClass(model.class);
    NSString *footClassString = self.footDictionary[modelClassString];
    if (!footClassString) return [UITableViewHeaderFooterView class];
    Class footClass = NSClassFromString(footClassString);
    return footClass;
}
- (Class)tableHeadClassByModel:(NSObject *)model{
    //根据model的class 找对应的 head的class
    NSString *modelClassString = NSStringFromClass(model.class);
    NSString *headClassString = self.headDictionary[modelClassString];
    if (!headClassString) return [UITableViewHeaderFooterView class];
    Class headClass = NSClassFromString(headClassString);
    return headClass;
}

//get
-(NSMutableDictionary *)classDictionary{
    if (!_classDictionary) {
        _classDictionary = [NSMutableDictionary dictionary];
    }
    return _classDictionary;
}
-(NSMutableDictionary *)footDictionary{
    if (!_footDictionary) {
        _footDictionary = [NSMutableDictionary dictionary];
    }
    return _footDictionary;
}
-(NSMutableDictionary *)headDictionary{
    if (!_headDictionary) {
        _headDictionary = [NSMutableDictionary dictionary];
    }
    return _headDictionary;
}
@end
