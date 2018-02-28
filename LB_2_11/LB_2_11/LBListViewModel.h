//
//  LBNetWork.h
//  LB_2_11
//
//  Created by libo on 2018/2/10.
//  Copyright © 2018年 libo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBFirstTableViewCellItem.h"
#import "JSONModel.h"

@interface LBListViewModel : JSONModel
@property (nonatomic, strong) NSMutableArray <LBFirstTableViewCellItem *> *items;
@property (nonatomic, strong) NSMutableArray <LBFirstTableViewCellItem *> *remoteDataArray;
@property (nonatomic, strong) NSMutableArray <LBFirstTableViewCellItem *> *localDataArray;

- (void)getData;
- (void)refreshFromRemote;
- (void)loadMore;
@end
