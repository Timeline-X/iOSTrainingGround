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

@interface LBTableViewController () <LBTableViewCellDelegate>


@end

@implementation LBTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    
    self.viewModel = [[LBListViewModel alloc] init];
    
    [self.viewModel getData];
    
    [self.viewModel addObserver:self forKeyPath:@"remoteDataArray" options:0 context:NULL];
    
    
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

#pragma mark - pull down refresh
- (void)refreshData
{
    [self.refreshControl beginRefreshing];

    [self.viewModel refreshFromRemote];
    
    [self.refreshControl endRefreshing];
    
    [self.tableView reloadData];
}

#pragma mark - pull up load more
/*
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ((self.tableView.contentOffset.y + self.tableView.frame.size.height) > self.tableView.contentSize.height) {
        [self.viewModel loadMore];
        [self.tableView reloadData];
    }
}
 */

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if ((self.tableView.contentOffset.y + self.tableView.frame.size.height) > self.tableView.contentSize.height) {
        [self.viewModel loadMore];
        [self.tableView reloadData];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"remoteDataArray"]) {
        self.viewModel.items = self.viewModel.remoteDataArray;
    }
}

@end
