//
//  LBTableViewController.h
//  LB_2_11
//
//  Created by libo on 2018/2/10.
//  Copyright © 2018年 libo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBListViewModel.h"

@interface LBTableViewController : UITableViewController
@property (nonatomic, strong) LBListViewModel *viewModel;
@end
