//
//  LBFristTableViewCell.m
//  LB_2_11
//
//  Created by libo on 2018/2/10.
//  Copyright © 2018年 libo. All rights reserved.
//

#import "LBFristTableViewCell.h"
#import "LBEncryption.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface LBFristTableViewCell ()

@end

@implementation LBFristTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.userNameLabel];
        [self.contentView addSubview:self.avatarImage];
        [self.contentView addSubview:self.subtitle];
        [self.contentView addSubview:self.dataImage];
        [self.contentView addSubview:self.shareButton];
    }
    
    return self;
}



- (void)setItem:(LBFirstTableViewCellItem *)item
{
    _item = item;
    
    self.userNameLabel.text = _item.model.userName;
    self.subtitle.text = _item.model.subtitle;
    
    [self.avatarImage sd_setImageWithURL:[NSURL URLWithString:self.item.model.avatarURLStr]];
    [self.dataImage sd_setImageWithURL:[NSURL URLWithString:self.item.model.imageURLStr]];
//    [self downloadAvatraImage];
//    [self downloadDataImage];
}

- (void)downloadAvatraImage
{
    self.avatarImage.image = nil;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.item.model.avatarURLStr]];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error && [self.item.model.avatarURLStr isEqualToString:request.URL.absoluteString]) {
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.avatarImage.image = image;
            });
        }
    }];
    [task resume];
}

- (void)downloadDataImage
{
    self.dataImage.image = nil;
    
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"imageCache"];
    
    if (![fm fileExistsAtPath:path]) {
        [fm createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString *md5Path = [LBEncryption md5EncryptinWithString:self.item.model.imageURLStr];
    NSString *filePath = [path stringByAppendingPathComponent:md5Path];
    
    if ([fm fileExistsAtPath:filePath]) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            UIImage *image = [UIImage imageWithContentsOfFile:filePath];
        
            dispatch_async(dispatch_get_main_queue(), ^{
                self.dataImage.image = image;
                
            });
        });
    }
    
    else {
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.item.model.imageURLStr]];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
        NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (!error && [self.item.model.imageURLStr isEqualToString:request.URL.absoluteString]) {
                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
                
                NSData *imageData = UIImagePNGRepresentation(image);
                [imageData writeToFile:filePath atomically:NO];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.dataImage.image = image;
                });
            }
        }];
        [task resume];
    }
}

#pragma mark - Action

- (void)shareButtonDidClicked:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(tableViewCell:shareButtonDidClicked:)]) {
        [self.delegate tableViewCell:self shareButtonDidClicked:sender];
    }
}


#pragma mark - Getter & Setter

- (UILabel *)userNameLabel {
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        CGRect frame = {80, 10, 200, 50};
        self.userNameLabel.frame = frame;
    }
    return _userNameLabel;
}

- (UIImageView *)avatarImage
{
    if (!_avatarImage) {
        _avatarImage = [[UIImageView alloc] init];
        CGRect frame = {10, 10, 50, 50};
        self.avatarImage.frame = frame;
    }
    return _avatarImage;
}

- (UILabel *)subtitle
{
    if (!_subtitle) {
        _subtitle = [[UILabel alloc] init];
        CGRect frame = {30.0, 80, 200, 30};
        self.subtitle.frame = frame;
    }
    return _subtitle;
}

- (UIImageView *)dataImage
{
    if (!_dataImage) {
        _dataImage = [[UIImageView alloc] init];
        CGRect frame = {10.0, 150.0, 300.0, 150.0};
        self.dataImage.frame = frame;
    }
    return _dataImage;
}

- (UIButton *)shareButton
{
    if (!_shareButton) {
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _shareButton.backgroundColor = [UIColor redColor];
        CGRect frame = {30.0, 320.0, 20.0, 20.0};
        self.shareButton.frame = frame;
        self.shareButton.titleLabel.text = @"share";
        [_shareButton addTarget:self action:@selector(shareButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareButton;
}

@end
