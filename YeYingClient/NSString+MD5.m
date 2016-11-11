//
//  NSString+MD5.m
//  YeYingDemo
//
//  Created by baidu on 16/11/7.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "NSString+MD5.h"
@implementation NSString (MD5)
- (id)MD5
{
    const char *utf8Str = [self UTF8String];
    unsigned char digest[16];
    unsigned int x=(int)strlen(utf8Str) ;
    CC_MD5(utf8Str, x, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return  output;
}
@end
