/************************************************************
 Class    : YZMD5.h
 Describe : MD5 加密工具类
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-06-15
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <Foundation/Foundation.h>

@interface YZMD5 : NSObject

+ (NSString *)encryptString:(NSString *)str;

@end
