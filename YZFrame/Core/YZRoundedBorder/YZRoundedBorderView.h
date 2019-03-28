/************************************************************
 Class    : YZRoundedBorderView.h
 Describe : 自定义可变的圆角和边框，某个角，多个角视图
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2019-03-28
 Version  : 1.0
 Declare  : Copyright © 2019 Yanzheng. All rights reserved.
 ************************************************************/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, BorderDirection) {   // 需要显示的边框方向
    BorderDirectionLeft     = 1 << 0,
    BorderDirectionRight    = 1 << 1,
    BorderDirectionBottom  = 1 << 2,
    BorderDirectionTop = 1 << 3,
    BorderDirectionAllCorners  = ~0UL
};
IB_DESIGNABLE

@interface YZRoundedBorderView : UIView

@property(nonatomic, assign) BorderDirection BD;//需要显示边框的方向  等于0时，什么方向都不画
@property(nonatomic, assign) UIRectCorner corners;//需要设置圆角的方向 等于0时，什么方向都不画
@property(nonatomic, assign) CGFloat radius;//圆角角度
@property(nonatomic, assign) CGFloat borderWidth;//边框宽度
@property(nonatomic, strong) UIColor *borderColor;//边框颜色

+ (void)setRoundedBorder:(CGRect)rect view:(UIView *)view BD:(BorderDirection)BD corners:(UIRectCorner)corners radius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

@end

NS_ASSUME_NONNULL_END
