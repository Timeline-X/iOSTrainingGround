//
//  LBListModel.m
//  LB_2_11
//
//  Created by libo on 2018/2/10.
//  Copyright © 2018年 libo. All rights reserved.
//

#import "LBListModel.h"
#import "JSONKeyMapper.h"

@implementation LBListModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                       @"userName": @"username",
                                                       @"avatarURLStr": @"avatarurl",
                                                       @"imageURLStr": @"imageurl"
                                                       }];
}
@end
