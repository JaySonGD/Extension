//
//  UIImage+View.h
//  18 . 彩票
//
//  Created by czljcb on 15/12/16.
//  Copyright © 2015年 czljcb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (View)
/**
 *  返回一个View的图片
 *
 *  @param view   要获取image的View
 */
+ (UIImage *)imageWithView:(UIView *)view;
@end
