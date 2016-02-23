//
//  NSURL+MIMEType.m
//  23 . Content-Type
//
//  Created by czljcb on 15/12/30.
//  Copyright © 2015年 czljcb. All rights reserved.
//

#import "NSURL+MIMEType.h"
#import <MobileCoreServices/MobileCoreServices.h>

@implementation NSURL (MIMEType)


- (NSString *)mimeType
{
    //NSURL *url = [NSURL fileURLWithPath:@"/Users/czljcb/Desktop/未命名.pdf"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self];
    __block id mimeType = nil;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
                if (connectionError)
                {
                    NSLog(@"失败----%@",connectionError);
                }
                mimeType = response.MIMEType;
                NSLog(@"成功----%@",mimeType);
                
        
        
    }];
    
    return mimeType;
}

//调用C语言的API来获得文件的MIMEType
-(NSString *)mimeTypeForFileAtPath:(NSString *)path
{
    if (![[[NSFileManager alloc] init] fileExistsAtPath:path]) {
        return nil;
    }
    
    path =  self.absoluteString;
    
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)[path pathExtension], NULL);
    CFStringRef MIMEType = UTTypeCopyPreferredTagWithClass (UTI, kUTTagClassMIMEType);
    CFRelease(UTI);
    if (!MIMEType) {
        return @"application/octet-stream";
    }
    return (__bridge NSString *)(MIMEType)
    ;
}

@end
