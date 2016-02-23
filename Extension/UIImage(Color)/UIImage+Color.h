//
//  UIImage+Color.h
//  18 . 彩票
//
//  Created by czljcb on 15/12/16.
//  Copyright © 2015年 czljcb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)
/**
 *  根据颜色生成一张尺寸为width*height的相同颜色图片
 *
 *  @param 
 */
+ (UIImage *)imageWithColor:(UIColor *)color andWidth:(CGFloat)width andHeight:(CGFloat)height;
@end
