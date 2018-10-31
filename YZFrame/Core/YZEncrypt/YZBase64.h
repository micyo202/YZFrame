/************************************************************
 Class    : YZBase64.h
 Describe : Base64 编码工具类
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-06-16
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <Foundation/Foundation.h>

@interface YZBase64 : NSObject

+ (NSString *)encodeString:(NSString *)str;
+ (NSString *)decodeString:(NSString *)str;

@end
