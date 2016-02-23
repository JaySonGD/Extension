//
//  UIImage+View.m
//  18 . 彩票
//
//  Created by czljcb on 15/12/16.
//  Copyright © 2015年 czljcb. All rights reserved.
//

#import "UIImage+View.h"

@implementation UIImage (View)

+ (UIImage *)imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContext(view.frame.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [view.layer renderInContext:ctx];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    NSData *data = UIImagePNGRepresentation(image);
    
    [data writeToFile:@"/users/czljcb/desktop/cz.png" atomically:YES];
    
    return image;
}
@end
