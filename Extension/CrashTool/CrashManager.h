/**
 
 在AppDelegate 注册
 
 //注册消息处理函数的处理方法,处理崩溃信息,写入本地
 NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);

 日志保存在 caches下
 
 
 **/


#import <Foundation/Foundation.h>




/** 捕捉Crash */
void uncaughtExceptionHandler(NSException *exception);

@interface CrashManager : NSObject



+(id)defaultManager;//单例

/** 移除Crash的log日志 */
+(void)clearCrashLog;

/** 是否有log日志 */
+(BOOL)isCrashLog;
/** crash log日志 */
+(NSArray< NSString * > *)crashLogContent;
@end
