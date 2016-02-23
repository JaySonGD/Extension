//
//  ViewController.m
//  ExtensionDemo
//
//  Created by czljcb on 16/2/23.
//  Copyright © 2016年 czljcb. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+Time.h"
#import "UIView+Frame.h"
#import "UITextField+Placeholder.h"
#import "NSDictionary+LogProperty.h"
#import "NSArray+Log.h"

#import <AFNetworking/AFNetworking.h>

#import "NSURLSession+NetWorking.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark **************************************************************************************************
#pragma mark NSDate+Time.h

- (void)NSDateTime
{
    //    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    //    fmt.dateFormat = @"yyyy-MM-dd hh:mm:ss";
    //
    //    NSDate *date = [fmt dateFromString:@"2016-02-22 12:34:56"];
    //
    //    BOOL flag = date.isMinute;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    //    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    //
    //
    //
    //   NSString *url = [@"http://apis.baidu.com/apistore/weatherservice/citylist?cityname=广州" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //    NSURL *URL = [NSURL URLWithString:url];
    //
    //
    //    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    //    [request addValue: @"3bcf3816b17d161cf5e718148cf2add1" forHTTPHeaderField: @"apikey"];
    //
    //    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
    //        if (error) {
    //            NSLog(@"Error: %@", error);
    //        } else {
    //            NSLog(@"%@ %@", response, responseObject);
    //        }
    //    }];
    //    [dataTask resume];
    
    
    
    //    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    //    textField.placeHolderColor = [UIColor redColor];
    //
    //    textField.placeholder = @"nime";
    //    [self.view addSubview:textField];
    
    
    //    NSDictionary *json = @{
    //
    //                           @"name": @"jason",
    //                           @"age": @(23),
    //
    //                           };
    //    [json logProperty];
    
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    [mgr.requestSerializer setValue:@"3bcf3816b17d161cf5e718148cf2add1" forHTTPHeaderField:@"apikey"];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [mgr GET:@"http://v.juhe.cn/cba/teamList.php?key=153818eca2ce9ea8a6b98af999f5d581" parameters:parameters
    progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
