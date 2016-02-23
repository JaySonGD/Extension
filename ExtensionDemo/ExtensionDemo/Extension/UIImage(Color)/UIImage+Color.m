//
//  UIImage+Color.m
//  18 . 彩票
//
//  Created by czljcb on 15/12/16.
//  Copyright © 2015年 czljcb. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color andWidth:(CGFloat)width andHeight:(CGFloat)height
{

    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f,width,height);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    NSData *data = UIImagePNGRepresentation(theImage);
    
    [data writeToFile:@"/users/czljcb/desktop/cz.png" atomically:YES];
    
    return theImage;
}

@end
