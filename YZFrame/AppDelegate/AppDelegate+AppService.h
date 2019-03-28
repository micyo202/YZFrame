/************************************************************
 Class    : AppDelegate+AppService.h
 Describe : 主代理类扩展，用于处理生命周期外的业务及初始化方法
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-10-31
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "AppDelegate.h"

@interface AppDelegate (AppService)

// 避免应用程序崩溃，在Crash时收集日志
- (void)initializeAvoidCrash;

// 显示FPS监测
- (void)initializeFPS;

@end
