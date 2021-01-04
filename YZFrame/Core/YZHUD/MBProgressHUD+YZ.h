/************************************************************
 Class    : MBProgressHUD+YZ.h
 Describe : 封装MBProgressHUD调用方法
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-06-05
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "MBProgressHUD.h"

@interface MBProgressHUD (YZ)

+ (void)showTipMessageInWindow:(NSString*)message;
+ (void)showTipMessageInView:(NSString*)message;
+ (void)showTipMessageInWindow:(NSString*)message delay:(float)delay;
+ (void)showTipMessageInView:(NSString*)message delay:(float)delay;

+ (void)showActivityMessageInWindow:(NSString*)message;
+ (void)showActivityMessageInView:(NSString*)message;
+ (void)showActivityMessageInWindow:(NSString*)message delay:(float)delay;
+ (void)showActivityMessageInView:(NSString*)message delay:(float)delay;

+ (void)showInfoMessage:(NSString *)message;
+ (void)showSuccessMessage:(NSString *)message;
+ (void)showWarnMessage:(NSString *)message;
+ (void)showErrorMessage:(NSString *)message;

+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message;
+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message;

+ (void)hideHUD;

// 顶部弹出提示
+ (void)showTopTipMessage:(NSString *)msg;
+ (void)showTopTipMessage:(NSString *)msg isWindow:(BOOL) isWindow;

@end
