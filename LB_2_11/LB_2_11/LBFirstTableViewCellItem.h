//
//  LBFirstTableViewCellItem.h
//  LB_2_11
//
//  Created by libo on 2018/2/10.
//  Copyright © 2018年 libo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBListModel.h"
#import "JSONModel.h"

@interface LBFirstTableViewCellItem : JSONModel <NSCoding>

@property (nonatomic, strong) LBListModel <Optional> *model;

@end
