//
//  LBNetWork.m
//  LB_2_11
//
//  Created by libo on 2018/2/10.
//  Copyright © 2018年 libo. All rights reserved.
//

#import "LBListViewModel.h"

@implementation LBListViewModel
- (void)getDataFromInternet
{
    LBFirstTableViewCellItem *itme1 = [[LBFirstTableViewCellItem alloc] init];
    itme1.model.userName = @"libo";
    itme1.model.avatarURLStr = @"http://f.hiphotos.baidu.com/image/pic/item/503d269759ee3d6db032f61b48166d224e4ade6e.jpg";
    itme1.model.imageURLStr = @"http://h.hiphotos.baidu.com/image/pic/item/18d8bc3eb13533fa4dd573ada3d3fd1f40345bd6.jpg";
    
    [self.items addObject:itme1];
}

- (NSMutableArray *)items
{
    if (!_items) {
        _items = [[NSMutableArray alloc] init];
    }
    return _items;
}

- (void)refreshFromInternet
{
    LBFirstTableViewCellItem *item2 = [[LBFirstTableViewCellItem alloc] init];
    item2.model.userName = @"lijun";
    
    [self.items addObject:item2];
}

- (void)loadMore
{
    LBFirstTableViewCellItem *item3 = [[LBFirstTableViewCellItem alloc] init];
    item3.model.userName = @"hehe";
    
    [self.items addObject:item3];
}

@end
