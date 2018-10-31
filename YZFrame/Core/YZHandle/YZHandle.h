/************************************************************
 Class    : YZHandle.h
 Describe : 常用方法处理类
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-06-12
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YZHandle : NSObject

// 将 NSData 转换成 16 进制字符串
+ (NSString *)convertDataToHexStr:(NSData *)data;

// 将 16 进制字符串转换成 NSData
+ (NSData *)convertHexStrToData:(NSString *)str;

// 将字符串指定位置隐藏为*
+ (NSString *)hideStr:(NSString *)str range:(NSRange)range;

// 将数字转化为货币格式的字符串（每隔三位一个逗号，保留两位小数）
+ (NSString *)moneyStringWithMoneyNumber:(float)moneyNum;

// 将银行卡号4位一个空格处理
+ (NSString *)bankCardNumWithString:(NSString *)string;

// 去掉字符串中特殊字符
+ (NSString *)replaceSpecialCharsOfString:(NSString *)string;

// 中文转换为拼音(传入汉字字符串, 返回大写拼音简拼、全拼)
+ (NSString *)pinYinWithChineseStr:(NSString *)chineseStr;

/**
 * lineView:       需要绘制成虚线的view
 * lineLength:     虚线的长度
 * lineSpacing:    虚线的间距
 * lineColor:      虚线的颜色
 */
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

/**
 *  计算文本所需的宽高
 *
 *  @param  str      需要计算的文本
 *  @param  font     文本显示的字体
 *  @param  maxSize  文本显示的范围
 *
 *  @return 文本实际所需的高度
 */
+ (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 * 计算文本在Label中所需的高度
 *
 * @param   text    要计算的文本内容
 * @param   width   宽度
 * @param   font    字体
 *
 * @return  所需的高度
 */
+ (CGFloat)heightWithText:(NSString *)text width:(CGFloat)width font:(UIFont *)font;

/**
 *  获取当前最顶端展示的视图控制器
 *
 *  @return 正在显示的视图控制器ViewController
 */
+ (UIViewController *)topViewController;

@end
