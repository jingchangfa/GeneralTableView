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
        self.layer.borderColor = [UIColor redColor].CGColor;
        self.layer.borderWidth = 1;
        [self addSubview:self.nameLabel];
//        [self addSubview:self.ageLabel];
    }
    return self;
}

-(void)setHeight:(float)height{
    self.nameLabel.frame = CGRectMake(0, 0, 100, height);
}

-(UITextView *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 100, 0)];
        _nameLabel.textColor = [UIColor redColor];
//        [_nameLabel sizeThatFits:<#(CGSize)#>]
        _nameLabel.scrollEnabled = NO;
        _nameLabel.delegate = self;
        UIFont *font = [UIFont systemFontOfSize:15 weight:0.1];
        _nameLabel.font = font;
    }
    return _nameLabel;
}
-(UILabel *)ageLabel{
    if (!_ageLabel) {
        _ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 375, 20)];
        _ageLabel.textColor = [UIColor blueColor];
        _ageLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _ageLabel;
}
-(void)textViewDidChange:(UITextView *)textView{
    [self.tableView beginUpdates];

    if (self.block) {
        self.height = self.block(textView.text);
    }
    
    [self.tableView endUpdates];

}

- (UITableView *)tableView
{
    UIView *tableView = self.superview;
    
    while (![tableView isKindOfClass:[UITableView class]] && tableView) {
        tableView = tableView.superview;
    }
    
    return (UITableView *)tableView;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
