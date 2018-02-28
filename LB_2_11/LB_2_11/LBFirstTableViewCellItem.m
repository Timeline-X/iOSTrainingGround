//
//  LBFirstTableViewCellItem.m
//  LB_2_11
//
//  Created by libo on 2018/2/10.
//  Copyright © 2018年 libo. All rights reserved.
//

#import "LBFirstTableViewCellItem.h"

@implementation LBFirstTableViewCellItem

- (LBListModel *)model
{
    if (!_model) {
        _model = [[LBListModel alloc] init];
    }
    return _model;
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.model.userName forKey:@"userName"];
    [aCoder encodeObject:self.model.avatarURLStr forKey:@"avatarURLStr"];
    [aCoder encodeObject:self.model.subtitle forKey:@"subtitle"];
    [aCoder encodeObject:self.model.imageURLStr forKey:@"imageURLStr"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if ([super init]) {
        self.model.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.model.avatarURLStr = [aDecoder decodeObjectForKey:@"avatarURLStr"];
        self.model.subtitle = [aDecoder decodeObjectForKey:@"subtitle"];
        self.model.imageURLStr = [aDecoder decodeObjectForKey:@"imageURLStr"];
    }
    return self;
}



@end
