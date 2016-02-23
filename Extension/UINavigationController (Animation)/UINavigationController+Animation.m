
//
//  UINavigationController+Animation.m
//  Push (Animation)
//
//  Created by czljcb on 15/12/23.
//  Copyright © 2015年 czljcb. All rights reserved.
//

#import "UINavigationController+Animation.h"
#import "UIView+CAAnimation.h"
@implementation UINavigationController (Animation)
- (void)customPushViewController:(UIViewController *)viewController
{
    [self pushViewController:viewController animated:NO];
    
    [self.view addSubview:viewController.view];

    [UIView transitionForView:self.view type:TransitionSuckEffect subtype:0 duration:0.5 animationKey:nil completion:^{

    }];
}

- (UIViewController *)customPopViewControllerAnimated:(BOOL)animated
{
     NSLog(@"%zd",self.childViewControllers.count);
    if (self.childViewControllers.count <2) {
        return nil;
    }
    UIViewController *viewController =  [self popViewControllerAnimated:NO];
     
    [self.view addSubview:[self.childViewControllers lastObject].view];

    [UIView transitionForView:self.view type:TransitionOglFlip subtype:0 duration:0.5 animationKey:nil completion:^{

    }];
    return viewController;
}


- (NSArray<UIViewController *> *)customPopToRootViewControllerAnimated:(BOOL)animated
{
    NSLog(@"%zd",self.childViewControllers.count);
    if (self.childViewControllers.count <2) {
        return nil;
    }
    NSArray  *UIViewControllers = [self popToRootViewControllerAnimated:NO];
    [self.view addSubview:[self.childViewControllers lastObject].view];
    
    [UIView transitionForView:self.view type:TransitionCube subtype:0 duration:0.5 animationKey:nil completion:^{
        
    }];
    return UIViewControllers;
}


- (NSArray<UIViewController *> *)customPopToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
     NSLog(@"%zd",self.childViewControllers.count);
    if (self.childViewControllers.count <2) {
        return nil;
    }
    NSArray  *UIViewControllers = [self popToViewController:viewController animated:NO];
    [self.view addSubview:[self.childViewControllers lastObject].view];
    
    [UIView transitionForView:self.view type:TransitionCube subtype:0 duration:2.1 animationKey:nil completion:^{
        
    }];
    return UIViewControllers;
}


@end
