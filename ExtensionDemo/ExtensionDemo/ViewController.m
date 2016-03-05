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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
//    [mgr.requestSerializer setValue:@"bt_app_android" forHTTPHeaderField:@"client_id"];
//    [mgr.requestSerializer setValue:@"ffcda7a1c4ff338e05c42e7972ba7b8d" forHTTPHeaderField:@"client_secret"];
//    [mgr.requestSerializer setValue:@"863575020819998" forHTTPHeaderField:@"track_deviceid"];
//    [mgr.requestSerializer setValue:@"Nibiru H1" forHTTPHeaderField:@"track_device_info"];
//    [mgr.requestSerializer setValue:@"yingyongbao" forHTTPHeaderField:@"channel_name"];
//    [mgr.requestSerializer setValue:@"1456234114971" forHTTPHeaderField:@"app_installtime"];
//    [mgr.requestSerializer setValue:@"5.3.1" forHTTPHeaderField:@"app_versions"];
//    [mgr.requestSerializer setValue:@"4.2.2" forHTTPHeaderField:@"os_versions"];
//    [mgr.requestSerializer setValue:@"1080" forHTTPHeaderField:@"screensize"];
//    [mgr.requestSerializer setValue:@"10" forHTTPHeaderField:@"v"];
//    [mgr.requestSerializer setValue:@"8" forHTTPHeaderField:@"scene"];
//    [mgr.requestSerializer setValue:@"topic_scene" forHTTPHeaderField:@"type"];
//    [mgr.requestSerializer setValue:@"1436266801" forHTTPHeaderField:@"update_time"];
//    [mgr.requestSerializer setValue:@"5" forHTTPHeaderField:@"page"];
//    [mgr.requestSerializer setValue:@"20" forHTTPHeaderField:@"pagesize"];













    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"client_id"] = @"bt_app_android";
    parameters[@"client_secret"] = @"ffcda7a1c4ff338e05c42e7972ba7b8d";

//    parameters[@"track_deviceid"] = @"863575020819998";

//    parameters[@"track_device_info"] = @"Nibiru H1";
//    parameters[@"channel_name"] = @"yingyongbao";

//    parameters[@"app_installtime"] = @"1456234114971";

//    parameters[@"app_versions"] = @"5.3.1";
//    parameters[@"os_versions"] = @"4.2.2";
//
//    parameters[@"screensize"] = @"1080";
//    parameters[@"v"] = @"10";
//    parameters[@"scene"] = @"8";
//
//    parameters[@"type"] = @"topic_scene";
//    parameters[@"update_time"] = @"1436266801";
//    parameters[@"page"] = @"5";
//    parameters[@"pagesize"] = @"20";



    
    [mgr POST:@"http://open4.bantangapp.com/topic/list" parameters:parameters
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
