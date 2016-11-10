//
//  CustomCell.h
//  iOSAdapterCellController_OC
//
//  Created by jing on 16/11/1.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef float(^CellHeightBlcok)(NSString *text);

@interface CustomCell : UITableViewCell<UITextViewDelegate>
@property (nonatomic,strong)UITextView *nameLabel;
@property (nonatomic,strong)UILabel *ageLabel;

@property (nonatomic,copy) CellHeightBlcok block;
@property (nonatomic)float height;;

-(void)setBlock:(CellHeightBlcok)block;
@end
