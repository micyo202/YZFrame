/************************************************************
 Class    : UIColor+YZ.h
 Describe : 自定义UIColor扩展类
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-06-06
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <UIKit/UIKit.h>

// 渐变色方式
typedef NS_ENUM(NSInteger, GradientType) {
    GradientFromTopToBottom,    // 从上到下
    GradientFromLeftToRight     // 从左到右
};

@interface UIColor (YZ)

// 根据16进制颜色代码生成颜色
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

// 绘制渐变颜色
+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr gradientType:(GradientType)gradientType;

@end
