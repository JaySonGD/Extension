//
//  NSURLSession+NetWorking.m
//  Wb
//
//  Created by czljcb on 16/1/21.
//  Copyright © 2016年 czljcb. All rights reserved.
//

#import "NSURLSession+NetWorking.h"

@implementation NSURLSession (NetWorking)

+ (void)apostWithURL : (NSString * __nonnull) urlString
           parameters:(nullable NSDictionary *)parameters
             fromData:(nullable NSData *)fromData
              success:(nullable void (^)(id _Nullable responseObject))success
              failure:(nullable void (^)(NSError * __nullable error))failure

{
    NSMutableString *urlStr = [NSMutableString string];
    __block BOOL andFlag = NO;
    [parameters enumerateKeysAndObjectsUsingBlock:^(NSString *  _Nonnull key, NSString *  _Nonnull obj, BOOL * _Nonnull stop) {
        if (andFlag) {
            [urlStr appendFormat:@"&%@=%@",key,obj];
        }else
        {
            [urlStr appendFormat:@"%@=%@",key,obj];
            andFlag = YES;
            
        }
    }];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [urlStr dataUsingEncoding:NSUTF8StringEncoding];
    
        NSURLSessionDataTask *task = [session uploadTaskWithRequest:request
                          fromData:fromData
                 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                     
                     if (error)
                     {
                         if (failure)
                         {
                             failure(error);
                         }
                     }
                     else
                     {
                         if (success)
                         {
                             id obj =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
                             
                             success(obj);
                         }
                     }

                 }];
    [task resume];

}

#define kBoundary @"----WebKitFormBoundaryMuD7vQ6009EzyTot"
#define kNewLine  [@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]

//- (void)upload:(NSString *)urlString name:(NSString *)name fileName :(NSString *)fileName data:(NSData *)data parameters:(NSDictionary *)parameters


+ (void)PostWithURL : (NSString * __nonnull) urlString
           parameters:(nullable NSDictionary *)parameters
             fromData:(nullable NSData *)fromData
              success:(nullable void (^)(id _Nullable responseObject))success
              failure:(nullable void (^)(NSError * __nullable error))failure
{
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    NSString *headerStr = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",kBoundary];
    [request setValue:headerStr forHTTPHeaderField:@"Content-Type"];
    
    request.HTTPMethod = @"POST";
    
    NSMutableData *bobyData = [NSMutableData data];
    
    [bobyData appendData: [[NSString stringWithFormat:@"--%@",kBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [bobyData appendData:kNewLine];
    
    
    // name 服务器规定的 filename （我们规定在服务器上显示的名字）
    NSString *str = [NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"",@"pic",@"cz.jpg"];
    
    [bobyData appendData: [str dataUsingEncoding:NSUTF8StringEncoding]];
    [bobyData appendData:kNewLine];
    [bobyData appendData: [@"Content-Type: application/octet-stream" dataUsingEncoding:NSUTF8StringEncoding]];
    [bobyData appendData:kNewLine];
    [bobyData appendData:kNewLine];
    
    
    [bobyData appendData:fromData];
    
    
    [parameters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        [bobyData appendData:kNewLine];
        [bobyData appendData: [[NSString stringWithFormat:@"--%@",kBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [bobyData appendData:kNewLine];
        
        NSString *str = [NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"",key];
        
        [bobyData appendData: [str dataUsingEncoding:NSUTF8StringEncoding]];
        [bobyData appendData:kNewLine];
        [bobyData appendData:kNewLine];
        [bobyData appendData:[obj dataUsingEncoding:NSUTF8StringEncoding]];
        
        
    }];
    
    [bobyData appendData:kNewLine];
    [bobyData appendData: [[NSString stringWithFormat:@"--%@--",kBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [bobyData appendData:kNewLine];
    //
    request.HTTPBody = bobyData;
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if (error)
        {
            if (failure)
            {
                failure(error);
            }
        }
        else
        {
            if (success)
            {
                id obj =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
                
                success(obj);
            }
        }

        
    }];
    
    //4.执行任务
    [task resume];
}


+ (void)postWithURL : (NSString * __nonnull) urlString
          parameters:(nullable NSDictionary *)parameters
             success:(nullable void (^)(id _Nullable responseObject))success
             failure:(nullable void (^)(NSError * __nullable error))failure
{
    NSMutableString *urlStr = [NSMutableString string];
    __block BOOL andFlag = NO;
    [parameters enumerateKeysAndObjectsUsingBlock:^(NSString *  _Nonnull key, NSString *  _Nonnull obj, BOOL * _Nonnull stop) {
        if (andFlag) {
            [urlStr appendFormat:@"&%@=%@",key,obj];
        }else
        {
            [urlStr appendFormat:@"%@=%@",key,obj];
            andFlag = YES;
            
        }
    }];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [urlStr dataUsingEncoding:NSUTF8StringEncoding];
    
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            if (failure)
            {
                failure(error);
            }
        }
        else
        {
            if (success)
            {
                id obj =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
                
                success(obj);
            }
        }
        
    }];
    [task resume];
}


+ (void)getWithURL : (NSString * __nonnull) urlString
         parameters:(nullable NSDictionary *)parameters
            success:(nullable void (^)(id _Nullable responseObject))success
            failure:(nullable void (^)(NSError * __nullable error))failure
{
    NSMutableString *urlStr = [NSMutableString stringWithFormat:@"%@?",urlString];
    __block BOOL andFlag = NO;
    [parameters enumerateKeysAndObjectsUsingBlock:^(NSString *  _Nonnull key, NSString *  _Nonnull obj, BOOL * _Nonnull stop) {
        if (andFlag) {
            [urlStr appendFormat:@"&%@=%@",key,obj];
        }else
        {
            [urlStr appendFormat:@"%@=%@",key,obj];
            andFlag = YES;
            
        }
    }];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL: [NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]
                                        completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                            
                                            if (error)
                                            {
                                                if (failure)
                                                {
                                                    failure(error);
                                                }
                                            }
                                            else
                                            {
                                                if (success)
                                                {
                                                    id obj =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
                                                    
                                                    success(obj);
                                                }
                                            }
                                        }];
    
    [task resume];
}


@end
