//
//  NSURL+MIMEType.h
//  23 . Content-Type
//
//  Created by czljcb on 15/12/30.
//  Copyright © 2015年 czljcb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (MIMEType)
- (NSString *)mimeType;
- (NSString *)mimeTypeForFileAtPath:(NSString *)path;
@end
