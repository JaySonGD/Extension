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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSDate *date = [NSDa]
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd hh:mm:ss";
    
    NSDate *date = [fmt dateFromString:@"2016-02-22 12:34:56"];
    
    BOOL flag = date.isMinute;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
