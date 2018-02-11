//
//  LBFirstTableViewCellItem.m
//  LB_2_11
//
//  Created by libo on 2018/2/10.
//  Copyright © 2018年 libo. All rights reserved.
//

#import "LBFirstTableViewCellItem.h"

@implementation LBFirstTableViewCellItem

- (LBListModel *)model
{
    if (!_model) {
        _model = [[LBListModel alloc] init];
    }
    return _model;
}
@end
