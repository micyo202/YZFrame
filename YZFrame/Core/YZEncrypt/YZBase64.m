/************************************************************
 Class    : YZBase64.m
 Describe : Base64 编码工具类
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-06-16
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "YZBase64.h"

@implementation YZBase64

+ (NSString *)encodeString:(NSString *)str {
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

+ (NSString *)decodeString:(NSString *)str {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:str options:0];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

@end
