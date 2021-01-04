/************************************************************
 Class    : SVProgressHUD+YZ.h
 Describe : 封装SVProgressHUD调用方法
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2021-01-03
 Version  : 1.0
 Declare  : Copyright © 2021 Yanzheng. All rights reserved.
 ************************************************************/

#import "SVProgressHUD+YZ.h"

@implementation SVProgressHUD (YZ)

+ (void)showActivity {
    [self showActivityMessage:@""];
}

+ (void)showActivityMessage:(NSString * )message {
    [self showActivityMessage:message delay:0];
}

+ (void)showActivityDelay:(float)delay{
    [self showActivityMessage:nil delay:delay];
}

+ (void)showActivityMessage:(NSString *)message delay:(float)delay {
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];    // 用户不可以做其他操作
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];          // 窗的背景块是白色，字跟圆圈是黑色
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeFlat]; // 圆圈的转动动作
    if(0 < delay) [SVProgressHUD dismissWithDelay:delay];
    if(nil == message || [message isEqualToString:@""]){
        [SVProgressHUD show];
    }else{
        [SVProgressHUD showWithStatus:message];
    }
}

+ (void)hideHUD {
    [self dismiss];
}

@end
