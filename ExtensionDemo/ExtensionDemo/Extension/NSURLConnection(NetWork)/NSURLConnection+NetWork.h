//
//  NSURLConnection+NetWork.h
//  22 . NSURLConnection
//
//  Created by czljcb on 15/12/27.
//  Copyright © 2015年 czljcb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSURLConnection (NetWork)

/**  异步连接的get请求 block实现 */
+ (void)getAndAsynchronousMethodWithURL : (NSString * __nonnull)urlString
                                   queue:(NSOperationQueue* __nonnull) queue
                       completionHandler:(void (^__nonnull)(NSURLResponse* __nullable response, NSData* __nullable data, NSError* __nullable connectionError)) handler;


/**  异步连接的get请求 block实现 */
+ (void)postAndAsynchronousMethodWithURL : (NSString * __nonnull) urlString
                                 httpBoby: (NSString * __nonnull) bobyString
                                    queue:(NSOperationQueue* __nonnull) queue
                        completionHandler:(void (^ __nonnull)(NSURLResponse* __nullable response, NSData* __nullable data, NSError* __nullable connectionError)) handler;

@end
