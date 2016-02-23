//
//  UIView+Spring.m
//  AnimationView
//
//  Created by ln on 15/11/10.
//  Copyright © 2015年 fancyLi. All rights reserved.
//

#import "UIView+Spring.h"

#define padding 10

@implementation UIView (Spring)

-(void)setSpringEffectAndDisplayTitle:(NSString *)title repeatCount:(int)count{
    
    CALayer* layer = [[CALayer alloc]init];
    layer.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    

    layer.cornerRadius = self.layer.cornerRadius;
    layer.backgroundColor = [UIColor blackColor].CGColor;
    layer.opacity = 0.5;
    [self.layer addSublayer:layer];
    
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    basicAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    basicAnimation.toValue = [NSNumber numberWithFloat:1.5];
    basicAnimation.duration = 1;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = count;
    [layer addAnimation:basicAnimation forKey:nil];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, padding, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) -2*padding)];
     titleLabel.textColor = [UIColor whiteColor];
    
     titleLabel.adjustsFontSizeToFitWidth = YES;
     titleLabel.textAlignment = NSTextAlignmentCenter;
     titleLabel.text = title;
    [self addSubview:titleLabel];
    [titleLabel.layer addAnimation:basicAnimation forKey:nil];
    
    [self performSelector:@selector(hide:) withObject:@{@"CALayer":layer,@"UILabel":titleLabel} afterDelay:2*count];
}

-(void)hide:(NSDictionary*)dict{
   
    CALayer *layer = [dict objectForKey:@"CALayer"];
    UILabel *label = [dict objectForKey:@"UILabel"];
    
    [UIView animateWithDuration:0.25 delay:0 options:0 << 16 animations:^{
        [layer removeFromSuperlayer];
        [label removeFromSuperview];
    } completion:^(BOOL finished) {
        
    }];
}

@end
