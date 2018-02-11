//
//  LBTableViewController.m
//  LB_2_11
//
//  Created by libo on 2018/2/10.
//  Copyright © 2018年 libo. All rights reserved.
//

#import "LBTableViewController.h"
#import "LBFristTableViewCell.h"
#import "LBListViewModel.h"
#import "LBShareViewController.h"
#import "LBFirstTableViewCellItem.h"

@interface LBTableViewController () <LBTableViewCellDelegate>

@property (nonatomic, strong) LBListViewModel *viewModel;

@end

@implementation LBTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.viewModel = [[LBListViewModel alloc] init];
    [self.viewModel getDataFromInternet];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"refresh"];
    [self.refreshControl addTarget:(self) action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LBFristTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (!cell) {
        cell = [[LBFristTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        cell.delegate = self;
    }
    if (self.viewModel.items.count > indexPath.row) {
        cell.item = self.viewModel.items[indexPath.row];
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 400;
}

#pragma mark - LBTableViewCellDelegate
- (void)tableViewCell:(LBFristTableViewCell *)cell shareButtonDidClicked:(UIButton *)shareButton
{
    LBShareViewController *shareVC = [[LBShareViewController alloc] init];
    [self.navigationController pushViewController:shareVC animated:YES];
}

#pragma mark - refresh
- (void)refreshData
{
    [self.refreshControl endRefreshing];
    LBFirstTableViewCellItem *item1 = [[LBFirstTableViewCellItem alloc] init];
    item1.model.userName = @"lijun";
    
    
    [self.viewModel.items addObject:item1];
    
    [self.tableView reloadData];
}

@end
