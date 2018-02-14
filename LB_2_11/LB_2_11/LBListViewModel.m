//
//  LBNetWork.m
//  LB_2_11
//
//  Created by libo on 2018/2/10.
//  Copyright © 2018年 libo. All rights reserved.
//

#import "LBListViewModel.h"

@implementation LBListViewModel

@synthesize items = _items;

- (void)getData
{
    __weak LBListViewModel *weakSelf = self;
    dispatch_queue_t dataQueue = dispatch_queue_create(NULL, DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(dataQueue, ^{
       [weakSelf getDataFromRemote];
       [weakSelf getDataFromLocal];
    });
}

- (void)getDataFromRemote
{
    LBFirstTableViewCellItem *item1 = [[LBFirstTableViewCellItem alloc] init];
    item1.model.userName = @"libo";
    item1.model.avatarURLStr = @"http://f.hiphotos.baidu.com/image/pic/item/503d269759ee3d6db032f61b48166d224e4ade6e.jpg";
    item1.model.imageURLStr = @"http://h.hiphotos.baidu.com/image/pic/item/18d8bc3eb13533fa4dd573ada3d3fd1f40345bd6.jpg";
    
    LBFirstTableViewCellItem *item2 = [[LBFirstTableViewCellItem alloc] init];
    item2.model.userName = @"iiii";
    item2.model.avatarURLStr = @"http://imgstore.cdn.sogou.com/app/a/11220002/26182_pc.jpg";
    item2.model.imageURLStr = @"http://upload.site.cnhubei.com/2015/0921/thumb_940__1442822393510.jpg";
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:item1, item2, nil];
    
    if (array) {
        self.remoteDataArray = array;
    }
}

- (void)getDataFromLocal
{
    NSString *file = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingString:@"items.data"];
    NSMutableArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
    
    if (array) {
        self.localDataArray = array;
        self.items = self.localDataArray;
    }
}

- (NSMutableArray *)items
{
    if (!_items) {
        _items = [[NSMutableArray alloc] init];
    }
    return _items;
}

- (void)setItems:(NSMutableArray<LBFirstTableViewCellItem *> *)items
{
    if (!_items) {
        _items = [[NSMutableArray alloc] init];
    }
    _items = items;
}

- (void)setRemoteDataArray:(NSMutableArray<LBFirstTableViewCellItem *> *)remoteDataArray
{
    if (!_remoteDataArray) {
        _remoteDataArray = [[NSMutableArray alloc] init];
    }
    _remoteDataArray = remoteDataArray;
}

- (void)setLocalDataArray:(NSMutableArray<LBFirstTableViewCellItem *> *)localDataArray
{
    if (!_localDataArray) {
        _localDataArray = [[NSMutableArray alloc] init];
    }
    _localDataArray = localDataArray;
}

- (void)refreshFromRemote
{
    
    LBFirstTableViewCellItem *item = [[LBFirstTableViewCellItem alloc] init];
    if (item) {
        item.model.userName = @"lijun";
        item.model.avatarURLStr = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1518439462060&di=87d49fd268826fd27ea5ce3d14beb2e9&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F12%2F38%2F13%2F25z58PICIaB.jpg";
        item.model.imageURLStr = @"http://d.hiphotos.baidu.com/image/pic/item/a044ad345982b2b713b5ad7d3aadcbef76099b65.jpg";
    }
    
    LBFirstTableViewCellItem *item1 = [[LBFirstTableViewCellItem alloc] init];
    if (item1) {
        item1.model.userName = @"rogueOne";
        item1.model.avatarURLStr = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1518439705822&di=dbd372b67a8739ffb3cd7d129b9d4494&imgtype=0&src=http%3A%2F%2Fimg.25pp.com%2Fuploadfile%2Fbizhi%2Fipad3%2F2015%2F0420%2F20150420091029815_ipad3.jpg";
        item1.model.imageURLStr = @"http://tse2.mm.bing.net/th?id=OIP.c7rFwBD-GnAkq3LdCHOwsQHaEo&pid=15.1";
    }
    
    if (item && item1) {
        [self.items removeAllObjects];
    }
    
    [self.items addObject:item];
    [self.items addObject:item1];
    
    [self writeToFile];
}

- (void)loadMore
{
    if (self.items.count < 5) {
        LBFirstTableViewCellItem *item = [[LBFirstTableViewCellItem alloc] init];
        item.model.userName = @"rogurTwo";
        item.model.avatarURLStr = @"http://img3.cache.netease.com/photo/0001/2016-01-22/BDUQ45AE00AO0001.jpg";
        item.model.imageURLStr = @"http://www.kaixian.tv/gd/d/file/201801/05/ae506fb05390e11501c7f3d6e387a475.jpeg?imageView&thumbnail=550x0";
        
        [self.items addObject:item];
        
        [self writeToFile];
    } else return;
}

- (void)writeToFile
{
    NSString *file = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingString:@"items.data"];
    [NSKeyedArchiver archiveRootObject:self.items toFile:file];
}

@end
