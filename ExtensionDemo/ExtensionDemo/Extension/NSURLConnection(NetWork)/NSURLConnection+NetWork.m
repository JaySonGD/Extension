//
//  NSURLConnection+NetWork.m
//  22 . NSURLConnection
//
//  Created by czljcb on 15/12/27.
//  Copyright © 2015年 czljcb. All rights reserved.
//

#import "NSURLConnection+NetWork.h"

@implementation NSURLConnection (NetWork)



/**  异步连接的get请求 block实现 */
+ (void)getAndAsynchronousMethodWithURL : (NSString *) urlString
                                  queue :(NSOperationQueue*) queue
                      completionHandler :(void (^)(NSURLResponse* __nullable response, NSData* __nullable data, NSError* __nullable connectionError)) handler
{
    
    [NSURLConnection sendAsynchronousRequest : [NSURLRequest requestWithURL:[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]
                                       queue :queue
                           completionHandler :^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError)
     {
         if (handler)
         {
             handler(response,data,connectionError);
         }
     }];
    
    
}


/**  异步连接的get请求 block实现 */
+ (void)postAndAsynchronousMethodWithURL : (NSString *) urlString // url 字符串
                                httpBoby : (NSString *) bobyString // 数据体
                                   queue :(NSOperationQueue*) queue // block 所在线程
                       completionHandler :(void (^)(NSURLResponse* __nullable response, NSData* __nullable data, NSError* __nullable connectionError)) handler
{
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    request.HTTPMethod = @"POST";
    request.HTTPBody = [bobyString dataUsingEncoding:NSUTF8StringEncoding];
    request.timeoutInterval = 15.0;
    
    
    [NSURLConnection sendAsynchronousRequest: request
                                       queue: queue
                           completionHandler: ^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError)
     {
         if (handler)
         {
             handler(response,data,connectionError);
         }
     }];
    
    
}

@end
