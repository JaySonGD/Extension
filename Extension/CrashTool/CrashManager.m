
#import "CrashManager.h"

static CrashManager *crashManager = nil;

#pragma mark - 捕捉Crash
void uncaughtExceptionHandler(NSException *exception)

{
    // 异常的堆栈信息
    NSArray *stackArray = [exception callStackSymbols];
    
    // 出现异常的原因
    NSString *reason = [exception reason];
    
    // 异常名称
    NSString *name = [exception name];
    
    NSString *exceptionInfo = [NSString stringWithFormat:@"奔溃原因：%@\n奔溃的名字：%@\n奔溃堆栈信息：%@",name, reason, stackArray];
    
    
    NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:stackArray];
    
    [tmpArr insertObject:reason atIndex:0];
    
    //保存到本地  --  当然你可以在下次启动的时候，上传这个log
    NSDateFormatter *fmr = [[NSDateFormatter alloc] init];
    fmr.dateFormat = @"yyyy-mm-dd HH-MM-SS";
    NSString *dateStr = [fmr stringFromDate:[NSDate date]];
 
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"CrashLogs"];
    
    // 判断文件夹是否存在，如果不存在，则创建
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSLog(@"%@",filePath);
    [exceptionInfo writeToFile: [NSString stringWithFormat:@"%@/%@",filePath,dateStr]  atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
}


@implementation CrashManager


+ (id)defaultManager
{
    @synchronized(self){
        static dispatch_once_t pred;
        dispatch_once(&pred, ^{
            crashManager = [[self alloc] init];
        });
    }
    return crashManager;
}


#pragma mark -移除Crash的log日志
+(void)clearCrashLog{
    
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"CrashLogs"];

    [[NSFileManager defaultManager ] removeItemAtPath:filePath error:nil];
    
}

#pragma mark - 是否有log日志
+(BOOL)isCrashLog{
    
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"CrashLogs"];
    
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:filePath]) return NO ;
    
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:filePath] objectEnumerator];
    NSString* fileName;
    BOOL isExist = YES;
    while ((fileName = [childFilesEnumerator nextObject]) != nil)
    {
        if ([fileName containsString:@"DS"] ) isExist = NO;
        else isExist = YES;

    }
    
    return isExist;
}




#pragma mark -crash log日志
+(NSArray< NSString * > *)crashLogContent{
    
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"CrashLogs"];
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:filePath]) return nil ;
    
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:filePath] objectEnumerator];
    NSString* fileName;
    NSMutableArray *txtPathArray = [NSMutableArray array];
    NSError *error;

    while ((fileName = [childFilesEnumerator nextObject]) != nil)
    {
        if ([fileName containsString:@"DS"] ) continue;

        NSString* fileAbsolutePath = [filePath stringByAppendingPathComponent:fileName];
        NSString *textFileContents = [NSString stringWithContentsOfFile:fileAbsolutePath encoding:NSUTF8StringEncoding error:&error];
        [txtPathArray addObject:textFileContents];
    }
    
    return txtPathArray;
}




@end
