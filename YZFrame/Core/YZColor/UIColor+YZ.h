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

@interface UIColor (YZ)

// 根据16进制颜色代码生成颜色
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
