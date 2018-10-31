/************************************************************
 Class    : YZJsonUtil.m
 Describe : JSON对象与OC对象转换
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-06-06
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "YZJsonUtil.h"

@implementation YZJsonUtil

+ (NSString *)JSONStringWithDictionaryOrArray:(id)dictionaryOrArray {
    
    if (dictionaryOrArray == nil) {
        return nil;
    }
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionaryOrArray options:NSJSONWritingPrettyPrinted error:nil];
    if (data == nil) {
        return nil;
    }
    
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return string;
    
}


+ (NSData *)JSONSDataWithDictionaryOrArray:(id)dictionaryOrArray {
    
    if (dictionaryOrArray == nil) {
        return nil;
    }
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionaryOrArray options:NSJSONWritingPrettyPrinted error:nil];
    return data;
}

+ (id)dictionaryOrArrayWithJSONSString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    return [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
}


+ (id)dictionaryOrArrayWithJSONSData:(NSData *)jsonData {
    
    if (jsonData == nil) {
        return nil;
    }
    
    return [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
}


+ (NSString *)stringWithForamtUTF8FromData:(NSData *)data {
    
    if (data == nil) {
        return nil;
    }
    
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return str;
    
}


+ (NSData *)dataWithJSONString:(NSString *)str {
    
    if (str == nil) {
        return nil;
    }
    
    NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
    return data;
}

@end
