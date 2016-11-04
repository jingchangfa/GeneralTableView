//
//  CustomCell.m
//  iOSAdapterCellController_OC
//
//  Created by jing on 16/11/1.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.nameLabel];
        [self addSubview:self.ageLabel];
    }
    return self;
}



-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 20)];
        _nameLabel.textColor = [UIColor redColor];
    }
    return _nameLabel;
}
-(UILabel *)ageLabel{
    if (!_ageLabel) {
        _ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 375, 20)];
        _ageLabel.textColor = [UIColor blueColor];
    }
    return _ageLabel;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
