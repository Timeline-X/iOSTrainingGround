//
//  LBNetWork.m
//  LB_2_11
//
//  Created by libo on 2018/2/10.
//  Copyright © 2018年 libo. All rights reserved.
//

#import "LBListViewModel.h"
#import "LBListModel.h"

@implementation LBListViewModel
- (void)getDataFromInternet
{
    LBListModel *model1 = [[LBListModel alloc] init];
    model1.userName = @"libo";
    
    
    [self.items addObject:model1];
}

- (NSMutableArray *)items
{
    if (!_items) {
        _items = [[NSMutableArray alloc] init];
    }
    return _items;
}
@end
