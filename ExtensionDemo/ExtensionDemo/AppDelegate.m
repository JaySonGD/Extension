//
//  AppDelegate.m
//  ExtensionDemo
//
//  Created by czljcb on 16/2/23.
//  Copyright © 2016年 czljcb. All rights reserved.
//

#import "AppDelegate.h"

#import <AFNetworkReachabilityManager.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//   AFNetworkReachabilityManager *MGR = [AFNetworkReachabilityManager sharedManager];
//    
//    [MGR setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        
//        NSLog(@"----%zd",status);
//        
//    }];
//    [MGR startMonitoring];
    
    //1.创建网络监测管理者
    AFNetworkReachabilityManager  *manager = [AFNetworkReachabilityManager sharedManager];
    
    //2.检测
    /*
     AFNetworkReachabilityStatusUnknown          = -1,   未知
     AFNetworkReachabilityStatusNotReachable     = 0,    没有网络
     AFNetworkReachabilityStatusReachableViaWWAN = 1,    蜂窝网络3G|4G
     AFNetworkReachabilityStatusReachableViaWiFi = 2,    WIFI
     */
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"wifi");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"蜂窝网络3G|4G");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                break;
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知");
                break;
            default:
                break;
        }
    }];
    
    //3.开始监测
    [manager startMonitoring];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
