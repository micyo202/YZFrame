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

#import "YZFrame.h"

@implementation AppDelegate (AppService)

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
