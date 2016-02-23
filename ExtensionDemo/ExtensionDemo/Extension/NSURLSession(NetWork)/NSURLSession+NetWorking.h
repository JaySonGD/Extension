//
//  NSURLSession+NetWorking.h
//  Wb
//
//  Created by czljcb on 16/1/21.
//  Copyright © 2016年 czljcb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLSession (NetWorking)

+ (void)PostWithURL : (NSString * __nonnull) urlString
          parameters:(nullable NSDictionary *)parameters
            fromData:(nullable NSData *)fromData
             success:(nullable void (^)(id _Nullable responseObject))success
             failure:(nullable void (^)(NSError * __nullable error))failure;


+ (void)postWithURL : (NSString * __nonnull) urlString
          parameters:(nullable NSDictionary *)parameters
             success:(nullable void (^)(id _Nullable responseObject))success
             failure:(nullable void (^)(NSError * __nullable error))failure;


+ (void)getWithURL : (NSString * __nonnull) urlString
         parameters:(nullable NSDictionary *)parameters
            success:(nullable void (^)(id _Nullable responseObject))success
            failure:(nullable void (^)(NSError * __nullable error))failure;


@end
