

#import <Foundation/Foundation.h>

@interface NSDate (Time)

/** 是否在1小时内 */
- (BOOL)isHour;

/** 是否是今年 */
- (BOOL)isYear;

/** 是否在今天内 */
- (BOOL)isToday;


/*
 是否在1分钟内
 */
- (BOOL)isMinute;

/** 是否是咋天 */
- (BOOL)isYesterday;

@end
