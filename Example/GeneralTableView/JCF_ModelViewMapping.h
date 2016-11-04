//
//  JCF_ModelViewMapping.h
//  GeneralTableView
//
//  Created by jing on 16/11/4.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCF_ModelViewMapping : NSObject
//添加
- (void)addCellClass:(Class)cellClass ByModelClass:(Class)modelClass;
- (void)addFootViewClass:(Class)footClass ByModelClass:(Class)modelClass;
- (void)addHeadViewClass:(Class)headClass ByModelClass:(Class)modelClass;

/**
 * 为空则代表单一的cell
 * 储存形势：@{@"modelClass":@"cellClass"}
 */
@property (nonatomic,strong)NSMutableDictionary *classDictionary;
@property (nonatomic,strong)NSMutableDictionary *footDictionary;
@property (nonatomic,strong)NSMutableDictionary *headDictionary;


- (NSString *)indentifulByModel:(NSObject *)model;
//转换
- (Class)tableCellClassByModel:(NSObject *)model;
- (Class)tableFootClassByModel:(NSObject *)model;
- (Class)tableHeadClassByModel:(NSObject *)model;

@end
