//
//  Calculator.m
//  CellSecondaryExpansion
//
//  Created by jing on 16/11/4.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator
- (NSInteger)tableNumberOfSections{
    return self.dataSourceArray.count;
}
- (NSInteger)tableNumberOfRowsInSection:(NSInteger)section{
    Day *oneDay = self.dataSourceArray[section];
    if ([self.indexArray containsObject:@(section)]) {
        return oneDay.content.count;
    }else{
        return 0;
    }
}
- (NSObject *)tableModelByIndex:(NSIndexPath *)indexPath{
    Day *oneDay = self.dataSourceArray[indexPath.section];
    return oneDay.content[indexPath.row];
}
- (NSObject *)tableSectionModelBySection:(NSInteger)section{
    Day *oneDay = self.dataSourceArray[section];
    return oneDay;
}

//获取cell的高度
- (float)getTheRowHeightByModel:(Hour *)hour{
    //自己根据 数据计算
    float height = [self stringHeightWithString:hour.text].height;
    if (height<20) {
        height = 20;
    }
    return height;
    return 40;
}
- (CGSize)stringHeightWithString:(NSString *)text{
    UIFont *font = [UIFont systemFontOfSize:15 weight:0.1];
    NSDictionary *dic = @{NSFontAttributeName:font};//输入的字体的大小
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin;
    CGSize maxSize = CGSizeMake(100, 1000);
    return [text boundingRectWithSize:maxSize options:options attributes:dic context:nil].size;
}
@end
