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
@property (nonatomic, strong) NSMutableArray <LBFirstTableViewCellItem *> *remoteDataArray;
@property (nonatomic, strong) NSMutableArray <LBFirstTableViewCellItem *> *localDataArray;

- (void)getData;
- (void)getDataFromRemote;
- (void)getDataFromLocal;
- (void)refreshFromRemote;
- (void)loadMore;
@end
