//
//  LBEncryption.m
//  LB_2_11
//
//  Created by libo on 2018/2/15.
//  Copyright © 2018年 libo. All rights reserved.
//

#import "LBEncryption.h"
#import <CommonCrypto/CommonDigest.h>

@implementation LBEncryption

+ (NSString *)md5EncryptinWithString:(NSString *)string
{
    return [self md5:string];
}

+ (NSString *)md5:(NSString *)string
{
    const char *cStr = [string UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:2 * CC_MD5_DIGEST_LENGTH];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}

@end
