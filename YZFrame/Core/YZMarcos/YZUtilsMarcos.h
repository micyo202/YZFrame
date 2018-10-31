/************************************************************
 Class    : YZUtilsMarcos.h
 Describe : 工具类宏
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-10-26
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#ifndef YZUtilsMarcos_h
#define YZUtilsMarcos_h

#pragma mark - 常用工具方法
#define APPLICATION     UIApplication.sharedApplication
#define DELEGATE        UIApplication.sharedApplication.delegate
#define WINDOW          UIApplication.sharedApplication.delegate.window

#pragma mark - 应用基本信息
#define InfoDictionary  NSBundle.mainBundle.infoDictionary                          // 应用基本信息字典
#define AppName         [InfoDictionary objectForKey:@"CFBundleDisplayName"]        // 应用名称
#define AppVersion      [InfoDictionary objectForKey:@"CFBundleShortVersionString"] // 应用版本号
#define AppBuildVersion [InfoDictionary objectForKey:@"CFBundleVersion"]            // 应用 build 号

#pragma mark - 字体方法
#define FontSize(size)      [UIFont systemFontOfSize:size]
#define FontBoldSize(size)  [UIFont boldSystemFontOfSize:size]

#pragma mark - 强弱引用
#define WeakSelf(type)  __weak typeof(type) weak##type = type;
#define StrongSelf(type) __strong typeof(type) type = weak##type;

#pragma mark - 测试环境日志输出
#ifdef  DEBUG
#define DLog(FORMAT, ...) NSLog((@"YZ [Debug Log]%s [Line %d] " FORMAT), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DLog(...)
#endif

#pragma mark - 单例模式方法
#pragma mark - 单例模式方法
#define SingletonH(name) + (instancetype)shared##name;

#define SingletonM(name) \
static id _instance; \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}\
\
- (id)mutableCopyWithZone:(NSZone *)zone { \
return _instance; \
}

#endif /* YZUtilsMarcos_h */
