//
//  UIView+Spring.h
//  AnimationView
//
//  Created by ln on 15/11/10.
//  Copyright © 2015年 fancyLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Spring)

/**
 *  为UIView类设置弹簧效果
 *
 *  @param title 显示的标题
 *  @param count 重复次数
 */
-(void)setSpringEffectAndDisplayTitle:(NSString*)title repeatCount:(int)count;

@end
