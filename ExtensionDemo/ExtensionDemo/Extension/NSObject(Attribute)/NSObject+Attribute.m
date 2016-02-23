//
//  NSObject+Attribute.m
//  runTime
//
//  Created by czljcb on 15/12/18.
//  Copyright © 2015年 czljcb. All rights reserved.
//

#import <objc/runtime.h>
#import "NSObject+Attribute.h"

@implementation NSObject (Attribute)


+ (void)ivarOutPutList:(Class )cls
{
    unsigned int count = 0;
    

    
    Ivar *ivars = class_copyIvarList(cls, &count);
    NSLog(@"-----------------------%d-----------------------",count);
    for (int i = 0; i < count; i ++)
    {
        Ivar iv = ivars[i];
        NSString *str = @(ivar_getName(iv));
        NSLog(@"    %@",str);
    }
    NSLog(@"------------------------------------------------");

}

+ (void)ivarOutPutList
{
    unsigned int count = 0;
    
    
    
    Ivar *ivars = class_copyIvarList([self class], &count);
    NSLog(@"-----------------------%d-----------------------",count);
    for (int i = 0; i < count; i ++)
    {
        Ivar iv = ivars[i];
        NSString *str = @(ivar_getName(iv));
        NSLog(@"|    %@",str);
    }
    NSLog(@"------------------------------------------------");
    
}

@end
