/************************************************************
 Class    : MBProgressHUD+YZ.m
 Describe : 封装MBProgressHUD调用方法
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-06-05
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "MBProgressHUD+YZ.h"
#import "YZScreenMarcos.h"
#import "YZUtilsMarcos.h"
#import "YZHandle.h"
#import "YYKit.h"

@implementation MBProgressHUD (YZ)

+ (MBProgressHUD*)createMBProgressHUDviewWithMessage:(NSString*)message isWindiw:(BOOL)isWindow
{
    UIView  *view = isWindow? (UIView*)[UIApplication sharedApplication].delegate.window:[self getCurrentUIVC].view;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.label.text = message ? message : @"加载中...";
    hud.label.font = [UIFont systemFontOfSize:15.f];
    hud.removeFromSuperViewOnHide = YES;
    hud.bezelView.backgroundColor = [UIColor blackColor];   // 设置背景颜色
    hud.contentColor = [UIColor whiteColor];    // 设置字体颜色
    return hud;
}
#pragma mark-------------------- show Tip----------------------------

+ (void)showTipMessageInWindow:(NSString*)message
{
    [self showTipMessage:message isWindow:true timer:2.f];
}
+ (void)showTipMessageInView:(NSString*)message
{
    [self showTipMessage:message isWindow:false timer:2.f];
}
+ (void)showTipMessageInWindow:(NSString*)message timer:(int)aTimer
{
    [self showTipMessage:message isWindow:true timer:aTimer];
}
+ (void)showTipMessageInView:(NSString*)message timer:(int)aTimer
{
    [self showTipMessage:message isWindow:false timer:aTimer];
}
+ (void)showTipMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(int)aTimer
{
    MBProgressHUD *hud = [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeText;
    [hud hideAnimated:YES afterDelay:aTimer];
}
#pragma mark-------------------- show Activity----------------------------

+ (void)showActivityMessageInWindow:(NSString*)message
{
    [self showActivityMessage:message isWindow:true timer:0];
}
+ (void)showActivityMessageInView:(NSString*)message
{
    [self showActivityMessage:message isWindow:false timer:0];
}
+ (void)showActivityMessageInWindow:(NSString*)message timer:(int)aTimer
{
    [self showActivityMessage:message isWindow:true timer:aTimer];
}
+ (void)showActivityMessageInView:(NSString*)message timer:(int)aTimer
{
    [self showActivityMessage:message isWindow:false timer:aTimer];
}
+ (void)showActivityMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(int)aTimer
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeIndeterminate;
    if (aTimer>0) {
        [hud hideAnimated:YES afterDelay:aTimer];
    }
}
#pragma mark-------------------- show Image----------------------------

+ (void)showSuccessMessage:(NSString *)message {
    NSString *name =@"MBProgressHUD+YZ.bundle/MBProgressHUD/MBHUD_Success";
    [self showCustomIconInWindow:name message:message];
}

+ (void)showErrorMessage:(NSString *)message {
    NSString *name =@"MBProgressHUD+YZ.bundle/MBProgressHUD/MBHUD_Error";
    [self showCustomIconInWindow:name message:message];
}

+ (void)showInfoMessage:(NSString *)message {
    NSString *name =@"MBProgressHUD+YZ.bundle/MBProgressHUD/MBHUD_Info";
    [self showCustomIconInWindow:name message:message];
}

+ (void)showWarnMessage:(NSString *)message {
    NSString *name =@"MBProgressHUD+YZ.bundle/MBProgressHUD/MBHUD_Warn";
    [self showCustomIconInWindow:name message:message];
}

+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message {
    [self showCustomIcon:iconName message:message isWindow:true];
}

+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message {
    [self showCustomIcon:iconName message:message isWindow:false];
}

+ (void)showCustomIcon:(NSString *)iconName message:(NSString *)message isWindow:(BOOL)isWindow {
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    hud.mode = MBProgressHUDModeCustomView;
    [hud hideAnimated:YES afterDelay:1.5f];
}

+ (void)hideHUD {
    UIView  *winView =(UIView*)[UIApplication sharedApplication].delegate.window;
    [self hideHUDForView:winView animated:YES];
    [self hideHUDForView:[self getCurrentUIVC].view animated:YES];
}

//获取当前屏幕显示的viewcontroller
+(UIViewController *)getCurrentWindowVC {
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tempWindow in windows) {
            if (tempWindow.windowLevel == UIWindowLevelNormal) {
                window = tempWindow;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    } else {
        result = window.rootViewController;
    }
    return  result;
}

+(UIViewController *)getCurrentUIVC {
    UIViewController  *superVC = [[self class]  getCurrentWindowVC];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }else if ([superVC isKindOfClass:[UINavigationController class]]) {
        return ((UINavigationController*)superVC).viewControllers.lastObject;
    }
    return superVC;
}

#pragma mark - 顶部tip提示
+ (void)showTopTipMessage:(NSString *)msg {
    [self showTopTipMessage:msg isWindow:NO];
}

+ (void)showTopTipMessage:(NSString *)msg isWindow:(BOOL) isWindow{
    CGFloat padding = 10;
    
    YYLabel *label = [[YYLabel alloc] init];
    label.text = msg;
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithRed:0.033 green:0.685 blue:0.978 alpha:1.0];
    label.width = WIDTH_SCREEN;
    label.textContainerInset = UIEdgeInsetsMake(padding+padding, padding, 0, padding);
    
    if (isWindow) {
        label.height = HEIGHT_TOP;
        label.bottom = 0;
        [WINDOW addSubview:label];
        
        [UIView animateWithDuration:0.3 animations:^{
            label.top = 0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                label.bottom = 0;
            } completion:^(BOOL finished) {
                [label removeFromSuperview];
            }];
        }];
        
    }else{
        label.height = [msg heightForFont:label.font width:label.width] + 2 * padding;
        label.bottom = HEIGHT_TOP;
        [[YZHandle topViewController].view addSubview:label];
        
        [UIView animateWithDuration:0.3 animations:^{
            label.top = HEIGHT_TOP;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                label.bottom = HEIGHT_TOP;
            } completion:^(BOOL finished) {
                [label removeFromSuperview];
            }];
        }];
        
    }
    
}

@end
