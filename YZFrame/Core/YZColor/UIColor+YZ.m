/************************************************************
 Class    : UIColor+YZ.m
 Describe : 自定义UIColor扩展类
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-06-06
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "UIColor+YZ.h"
#import "YZColorMarcos.h"

@implementation UIColor (YZ)

#pragma mark - 根据16进制颜色代码生成颜色
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    // R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return RgbColor(r, g, b, alpha);
}

#pragma mark - 绘制渐变颜色
+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr gradientType:(GradientType)gradientType {
    
    // CAGradientLayer类对其绘制渐变背景颜色、填充层的形状(包括圆角)
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = view.bounds;
    
    // 创建渐变色数组，需要转换为CGColor颜色
    gradientLayer.colors = @[(__bridge id)HexColor(fromHexColorStr, 1.f).CGColor,(__bridge id)HexColor(toHexColorStr, 1.f).CGColor];
    
    if(GradientFromLeftToRight == gradientType){    // 渐变色从做往右
        // 设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)，(0, 0)~(1, 0)表示水平渐变
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1, 0);
    }
    if(GradientFromTopToBottom == gradientType){    // 渐变色从上往下
        // 设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)，(0, 0)~(, 1)表示竖直渐变
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(0, 1);
    }
    
    // 设置颜色变化点，取值范围 0.0~1.0
    gradientLayer.locations = @[@0, @1];
    
    return gradientLayer;
}

@end
