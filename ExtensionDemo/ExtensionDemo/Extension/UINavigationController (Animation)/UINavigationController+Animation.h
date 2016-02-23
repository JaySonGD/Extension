//
//  UINavigationController+Animation.h
//  Push (Animation)
//
//  Created by czljcb on 15/12/23.
//  Copyright © 2015年 czljcb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Animation)
- (void)customPushViewController:(UIViewController *)viewController;
- (UIViewController *)customPopViewControllerAnimated:(BOOL)animated;
- (NSArray<UIViewController *> *)customPopToRootViewControllerAnimated:(BOOL)animated;
- (NSArray<UIViewController *> *)customPopToViewController:(UIViewController *)viewController animated:(BOOL)animated;
@end
