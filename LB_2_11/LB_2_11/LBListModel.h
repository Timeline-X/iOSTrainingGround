//
//  LBListModel.h
//  LB_2_11
//
//  Created by libo on 2018/2/10.
//  Copyright © 2018年 libo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface LBListModel : JSONModel
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *avatarURLStr;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *imageURLStr;
@end
