//
//  NSString+Base64.m
//  03-用户登录
//
//  Created by czljcb on 15/12/31.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "NSString+Base64.h"

@implementation NSString (Base64)



/** 编码 */
- (NSString *)base64Encode:(NSString *)str
{
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    return [data base64EncodedStringWithOptions:0];
}

/** 解码 */
- (NSString *)base64Decode:(NSString *)str
{
    NSData *data = [[NSData alloc] initWithBase64EncodedString:str options:0];
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
@end
