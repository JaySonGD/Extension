//
//  UIImage+Stretch.m
//  18 . 彩票
//
//  Created by czljcb on 15/12/18.
//  Copyright © 2015年 czljcb. All rights reserved.
//

#import "UIImage+Stretch.h"

@implementation UIImage (Stretch)


+ (UIImage *)imageStretchWithImage:(UIImage *)image
{
    
    UIImage *newImage = [image stretchableImageWithLeftCapWidth:image.size.width *0.5 -1 topCapHeight:image.size.height *0.5 - 1];
    
    //UIImage *image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.5, image.size.width * 0.5, image.size.height * 0.5 - 1, image.size.width * 0.5-1)];
    
    return newImage;
}
@end
