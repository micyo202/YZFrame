/************************************************************
 Class    : YZJsonUtil.h
 Describe : JSON对象与OC对象转换
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-06-06
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <Foundation/Foundation.h>

@interface YZJsonUtil : NSObject

/*
 NSJSONReadingMutableContainers：
 返回可变容器，
 NSMutableDictionary或NSMutableArray。
 */

/*
 NSJSONReadingMutableLeaves：
 返回的JSON对象中字符串的值为NSMutableString，
 目前在iOS 7上测试不好用，应该是个bug
 */

/*
 NSJSONReadingAllowFragments：
 允许JSON字符串最外层既不是NSArray也不是NSDictionary，
 但必须是有效的JSON Fragment。
 例如使用这个选项可以解析 @“123”这样的字符串。
 */

/*
 *将字典或者数组转换为JSON格式字符串
 @return JSON格式字符串
 */
+ (NSString *)JSONStringWithDictionaryOrArray:(id)dictionaryOrArray;


/*
 * 将字典或者数组转换为JSON的Data
 @return JSON的Data
 */
+ (NSData *)JSONSDataWithDictionaryOrArray:(id)dictionaryOrArray;


/*
 * 将JSON格式字符串转换为字典或者数组
 @return 字典或者数组
 */
+ (id)dictionaryOrArrayWithJSONSString:(NSString *)jsonString;


/*
 * 将JSON的Data转换为字典或者数组
 @return 字典或者数组
 */
+ (id)dictionaryOrArrayWithJSONSData:(NSData *)jsonData;


/*
 * 将Data转换为UTF-8格式的字符串
 @return 字符串
 */
+ (NSString *)stringWithForamtUTF8FromData:(NSData *)data;


/*
 * 将NSString转换为NSData
 @return NSData
 */
+ (NSData *)dataWithJSONString:(NSString *)str;

@end
