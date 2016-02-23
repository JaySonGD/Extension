//
//  UIImage+Create.m
//  CreateImage
//
//  Created by czljcb on 15/12/24.
//  Copyright © 2015年 czljcb. All rights reserved.
//

#import "UIImage+Create.h"

@implementation UIImage (Create)

#define scale  [UIScreen mainScreen].scale;


// 获取到的Size是相对imageView在屏幕的Size
+ (UIImage *)imageCreateWithImage:(UIImage *) image andRect:(CGRect )rect
{
    //指定一个图片,指定一个区域,根据区域,从给定的图片当中,截取一张新的图片
    //CGImageCreateWithImageInRect底层是C语言.在C语言当中, 它是没有点坐标.它都是以像素为坐标.

    CGFloat clipX = rect.origin.x;
    CGFloat clipY = rect.origin.y;
    CGFloat clipW = rect.size.width * scale;
    CGFloat clipH = rect.size.height * scale;
    CGImageRef clipImage =  CGImageCreateWithImageInRect(image.CGImage, CGRectMake(clipX, clipY, clipW, clipH));
    
    
    //把CGImage转成Uiimage
    return [UIImage imageWithCGImage:clipImage];
}

@end
