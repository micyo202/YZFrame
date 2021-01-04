/************************************************************
 Class    : SVProgressHUD+YZ.h
 Describe : 封装SVProgressHUD调用方法
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2021-01-03
 Version  : 1.0
 Declare  : Copyright © 2021 Yanzheng. All rights reserved.
 ************************************************************/

#import "SVProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface SVProgressHUD (YZ)

+ (void)showActivity;
+ (void)showActivityMessage:(NSString* _Nullable)message;
+ (void)showActivityDelay:(float)delay;
+ (void)showActivityMessage:(NSString* _Nullable)message delay:(float)delay;

+ (void)hideHUD;

@end

NS_ASSUME_NONNULL_END
