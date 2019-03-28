/************************************************************
 Class    : AppDelegate+AppService.m
 Describe : 主代理类扩展，用于处理生命周期外的业务及初始化方法
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-10-31
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "AppDelegate+AppService.h"
#import <AvoidCrash.h>

#import "YZFrame.h"

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

#pragma mark - 添加FPS监测
- (void)initializeFPS {
    YZFPSLabel *_fpsLabel = [[YZFPSLabel alloc] init];
    [_fpsLabel sizeToFit];
    _fpsLabel.bottom = HEIGHT_SCREEN - HEIGHT_TAB_BAR - 10;
    _fpsLabel.right = WIDTH_SCREEN - 10;
    //_fpsLabel.alpha = 0;
    
    // enable touch delivery
    _fpsLabel.userInteractionEnabled = YES;
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(fpsLabelDragged:)];
    [_fpsLabel addGestureRecognizer:gesture];
    
    [WINDOW addSubview:_fpsLabel];
}
#pragma mark FPS标签移动方法
- (void)fpsLabelDragged:(UIPanGestureRecognizer *)gesture {
    
    UILabel *label = (UILabel *)gesture.view;
    CGPoint translation = [gesture translationInView:label];
    
    // move label
    label.center = CGPointMake(label.center.x + translation.x, label.center.y + translation.y);
    
    // reset translation
    [gesture setTranslation:CGPointZero inView:label];
    
}

@end
