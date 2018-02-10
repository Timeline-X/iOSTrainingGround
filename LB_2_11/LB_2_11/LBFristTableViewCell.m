//
//  LBFristTableViewCell.m
//  LB_2_11
//
//  Created by libo on 2018/2/10.
//  Copyright © 2018年 libo. All rights reserved.
//

#import "LBFristTableViewCell.h"

@interface LBFristTableViewCell ()
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UIImageView *avatarImage;
@property (nonatomic, strong) UILabel *subtitle;
@property (nonatomic, strong) UIImageView *dataImage;
@end

@implementation LBFristTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.userNameLabel];
        [self.contentView addSubview:self.avatarImage];
        [self.contentView addSubview:self.subtitle];
        [self.contentView addSubview:self.dataImage];
    }
    
    return self;
}

- (void)setModel:(LBListModel *)model
{
    _model = model;
    
    self.userNameLabel.text = _model.userName;
    self.subtitle.text = _model.subtitle;
//    self.avatarImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_model.avatarURLStr]]];
//    self.dataImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_model.imageURLStr]]];
    
}



#pragma mark - Getter & Setter

- (UILabel *)userNameLabel {
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        CGRect frame = {30.0, 5.0, 50.0, 15.0};
        self.userNameLabel.frame = frame;
    }
    return _userNameLabel;
}

- (UIImageView *)avatarImage
{
    if (!_avatarImage) {
        _avatarImage = [[UIImageView alloc] init];
        CGRect frame = {5.0, 5.0, 15.0, 15.0};
        self.avatarImage.frame = frame;
    }
    return _avatarImage;
}

- (UILabel *)subtitle
{
    if (!_subtitle) {
        _subtitle = [[UILabel alloc] init];
        CGRect frame = {30.0, 22, 50.0, 10.0};
        self.subtitle.frame = frame;
    }
    return _subtitle;
}

- (UIImageView *)dataImage
{
    if (!_dataImage) {
        _dataImage = [[UIImageView alloc] init];
        CGRect frame = {5.0, 35.0, 70.0, 35.0};
        self.dataImage.frame = frame;
    }
    return _dataImage;
}


@end
