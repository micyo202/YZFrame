/************************************************************
 Class    : YZRoundedBorderLabel.h
 Describe : 自定义可变的圆角和边框，某个角，多个角Label
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2019-03-28
 Version  : 1.0
 Declare  : Copyright © 2019 Yanzheng. All rights reserved.
 ************************************************************/

#import <UIKit/UIKit.h>
#import "YZRoundedBorderView.h"

NS_ASSUME_NONNULL_BEGIN

@interface YZRoundedBorderLabel : UILabel

@property(nonatomic, assign) BorderDirection BD; // 需要显示边框的方向  等于0时，什么方向都不画
@property(nonatomic, assign) UIRectCorner corners;   // 需要设置圆角的方向 等于0时，什么方向都不画
@property(nonatomic, assign) CGFloat radius; // 圆角角度
@property(nonatomic, assign) CGFloat borderWidth;    // 边框宽度
@property(nonatomic, strong) UIColor *borderColor;  // 边框颜色

@end

NS_ASSUME_NONNULL_END
