/************************************************************
 Class    : UIButton+YZ.h
 Describe : UIButton扩展类，用于防止按钮重复点击
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-06-16
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <UIKit/UIKit.h>

@interface UIButton (YZ)

@property (nonatomic, assign) NSTimeInterval yz_acceptEventInterval;    // 重复点击的间隔

@end
