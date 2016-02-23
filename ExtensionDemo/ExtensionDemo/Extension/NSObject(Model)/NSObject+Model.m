//
//  NSObject+Model.m
//  27. RunTime KVO
//
//  Created by czljcb on 16/1/12.
//  Copyright © 2016年 czljcb. All rights reserved.
//

#import "NSObject+Model.h"

#import <objc/message.h>

@implementation NSObject (Model)


+ (instancetype)objectWithDictionary:(NSDictionary *)dict
{
    id obj = [[self alloc] init];
    
    
    unsigned int outCount = 0;
    
    Ivar *ivars = class_copyIvarList(self, &outCount);
    
    for (NSInteger i = 0; i < outCount; i ++)
    {
        
        NSString *ivarName = @(ivar_getName(ivars[i]));
        NSString *key = [ivarName substringFromIndex:1];
        
        NSString *ivarType = @(ivar_getTypeEncoding(ivars[i]));
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@\"" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        
        
        id value = dict[key];
        
        if ([dict[key] isKindOfClass:[NSDictionary class]]  && ![ivarType hasPrefix:@"NS"])
        {
            Class modelClass =  NSClassFromString(ivarType);
            value = [modelClass objectWithDictionary:dict[key]];
        }
        
        if (value)
        {
            [obj setValue: value forKey:key];
        }
        
        
    }
    
    return obj;
}
@end
