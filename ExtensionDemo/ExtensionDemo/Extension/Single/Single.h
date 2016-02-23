//
// 单例
//




#define singleH(name)   + (instancetype)shared##name;


#if __has_feature(objc_arc)
//ARC


#define singleM(name)                                               \
                                                                    \
static id _instance;                                               \
                                                                    \
+(instancetype)allocWithZone:(struct _NSZone *)zone                 \
{                                                                   \
    static dispatch_once_t onceToken;                               \
    dispatch_once(&onceToken, ^{                                    \
                                                                    \
        _instance = [super allocWithZone:zone];                     \
                                                                    \
    });                                                             \
    return _instance;                                               \
}                                                                   \
                                                                    \
- (id)copyWithZone:(NSZone *)zone                                   \
{                                                                   \
    return _instance;                                               \
}                                                                   \
                                                                    \
- (id)mutableCopyWithZone:(NSZone *)zone                            \
{                                                                   \
    return _instance;                                               \
}                                                                   \
                                                                    \
+ (instancetype)shared##name                                        \
{                                                                   \
    return [[self alloc] init];                                     \
}                                                                   \



#else
//MRC


#define singleM(name)                                               \
                                                                    \
static id _instance;                                               \
                                                                    \
+(instancetype)allocWithZone:(struct _NSZone *)zone                 \
{                                                                   \
    static dispatch_once_t onceToken;                               \
    dispatch_once(&onceToken, ^{                                    \
                                                                    \
        _instance = [super allocWithZone:zone];                     \
                                                                    \
    });                                                             \
    return _instance;                                               \
}                                                                   \
                                                                    \
- (id)copyWithZone:(NSZone *)zone                                   \
{                                                                   \
    return _instance;                                               \
}                                                                   \
                                                                    \
- (id)mutableCopyWithZone:(NSZone *)zone                            \
{                                                                   \
    return _instance;                                               \
}                                                                   \
                                                                    \
+ (instancetype)shared##name                                        \
{                                                                   \
    return [[self alloc] init];                                     \
}                                                                   \
                                                                    \
- (oneway void)release                                              \
{                                                                   \
                                                                    \
}                                                                   \
                                                                    \
- (instancetype)retain                                              \
{                                                                   \
    return _instance;                                               \
}                                                                   \
                                                                    \
- (NSUInteger)retainCount                                           \
{                                                                   \
    return MAXFLOAT;                                                \
}

#endif

