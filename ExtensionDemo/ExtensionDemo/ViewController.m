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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
//    fmt.dateFormat = @"yyyy-MM-dd hh:mm:ss";
//    
//    NSDate *date = [fmt dateFromString:@"2016-02-22 12:34:56"];
//    
//    BOOL flag = date.isMinute;
    
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    textField.placeHolderColor = [UIColor redColor];

    textField.placeholder = @"nime";
    [self.view addSubview:textField];
    
    
    NSDictionary *json = @{
                           
                           @"name": @"jason",
                           @"age": @(23),
                           
                           };
    [json logProperty];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
