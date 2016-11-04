//
//  HeaderView.m
//  CellSecondaryExpansion
//
//  Created by jing on 16/11/4.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.label];
    }
    return self;
}
-(UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc] init];
    }
    return _label;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
