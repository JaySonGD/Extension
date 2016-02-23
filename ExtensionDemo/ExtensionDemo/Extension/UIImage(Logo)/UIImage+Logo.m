//
//  UIImage+ Logo.m
//  18.2 logo
//
//  Created by czljcb on 15/11/15.
//  Copyright (c) 2015年 czljcb. All rights reserved.
//

#import "UIImage+Logo.h"

@implementation UIImage (Logo)
+(UIImage *)imageWithBackgroudImage:(NSString*)imageName LogoImage:(NSString *)logoName ToFile:(NSString *)path
{
    UIImage *bgImage = [UIImage imageNamed:imageName];
    
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 0.0);
    
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    UIImage *logoImage = [UIImage imageNamed:logoName];
    [logoImage drawInRect:CGRectMake(bgImage.size.width - logoImage.size.width  , bgImage.size.height - logoImage.size.height , logoImage.size.width * 0.5, logoImage.size.height * 0.5)];
    
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    
    NSData *imageData = UIImagePNGRepresentation(image);
    [imageData writeToFile:path atomically:YES];
	

    return image;
}

@end
