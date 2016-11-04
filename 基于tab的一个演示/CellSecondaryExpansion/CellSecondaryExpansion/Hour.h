//
//  Hour.h
//  CellSecondaryExpansion
//
//  Created by jing on 16/11/4.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hour : NSObject
@property (nonatomic,strong) NSString *text;
@property (nonatomic,strong) NSString *time;
@property (nonatomic,strong) NSString *type;

+ (NSArray <Hour *>*)hoursByTag:(int)tag;
@end
