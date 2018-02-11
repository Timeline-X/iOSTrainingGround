//
//  LBFristTableViewCell.h
//  LB_2_11
//
//  Created by libo on 2018/2/10.
//  Copyright © 2018年 libo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBFirstTableViewCellItem.h"

@class LBFristTableViewCell;

@protocol LBTableViewCellDelegate <NSObject>
- (void)tableViewCell:(LBFristTableViewCell *)cell shareButtonDidClicked:(UIButton *)shareButton;
@end

@interface LBFristTableViewCell : UITableViewCell
@property (nonatomic, strong) LBFirstTableViewCellItem *item;
@property (nonatomic, weak) id <LBTableViewCellDelegate> delegate;
@end
