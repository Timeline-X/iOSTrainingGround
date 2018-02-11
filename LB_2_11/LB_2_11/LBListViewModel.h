//
//  LBNetWork.h
//  LB_2_11
//
//  Created by libo on 2018/2/10.
//  Copyright © 2018年 libo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBFirstTableViewCellItem.h"

@interface LBListViewModel : NSObject
@property (nonatomic, strong) NSMutableArray <LBFirstTableViewCellItem *> *items;

- (void)getDataFromInternet;
- (void)refreshFromInternet;
- (void)loadMore;
@end
