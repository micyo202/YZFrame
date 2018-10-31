/************************************************************
 Class    : YZAES.h
 Describe : AES 加解密工具类
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-06-16
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <Foundation/Foundation.h>

@interface YZAES : NSObject

+ (NSString *)encryptString:(NSString *)str key:(NSString *)key;
+ (NSString *)decryptString:(NSString *)str key:(NSString *)key;

@end
