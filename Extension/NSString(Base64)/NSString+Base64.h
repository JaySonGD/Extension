//
//  NSString+Base64.h
//  03-用户登录
//
//  Created by czljcb on 15/12/31.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Base64)
/** 编码 */
+ (NSString *)base64Encode:(NSString *)str;


/** 解码 */
+ (NSString *)base64Decode:(NSString *)str;
@end
