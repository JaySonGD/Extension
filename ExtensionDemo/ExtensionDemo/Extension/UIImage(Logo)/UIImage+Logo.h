//
//  UIImage+Logo.h
//  18.2 logo
//
//  Created by czljcb on 15/11/15.
//  Copyright (c) 2015年 czljcb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Logo)

+(UIImage *)imageWithBackgroudImage:(NSString*)imageName LogoImage:(NSString *)logoName ToFile:(NSString *)path;

@end
