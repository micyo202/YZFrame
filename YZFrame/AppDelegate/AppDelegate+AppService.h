//
//  AppDelegate+AppService.h
//  YZFrame
//
//  Created by cycfc on 2018/10/31.
//  Copyright © 2018年 Yanzheng. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (AppService)

// 避免应用程序崩溃，在Crash时收集日志
- (void)initializeAvoidCrash;

@end
