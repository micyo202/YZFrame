//
//  AppDelegate+AppService.m
//  YZFrame
//
//  Created by cycfc on 2018/10/31.
//  Copyright © 2018年 Yanzheng. All rights reserved.
//

#import "AppDelegate+AppService.h"
#import <AvoidCrash.h>

@implementation AppDelegate (AppService)

#pragma mark - 避免应用程序崩溃，在Crash时收集日志
- (void)initializeAvoidCrash {
    [AvoidCrash becomeEffective];
    //监听通知:AvoidCrashNotification, 获取AvoidCrash捕获的崩溃日志的详细信息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealwithCrashMessage:) name:AvoidCrashNotification object:nil];
}

#pragma mark 应用Crash时收集日志信息
- (void)dealwithCrashMessage:(NSNotification *)note {
    //注意:所有的信息都在userInfo中
    //你可以在这里收集相应的崩溃信息进行相应的处理(比如传到自己服务器)
    NSLog(@"%@",note.userInfo);
}

@end
