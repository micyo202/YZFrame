/************************************************************
 Class    : YZSalt.m
 Describe : Salt 加盐类
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-08-28
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "YZSalt.h"

@implementation YZSalt

#pragma mark - 对指定字符串进行加盐
+ (NSString *)encryptString:(NSString *)str length:(NSInteger)length {
    NSString *randomStr = @"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSString *saltStr = @"";
    int count = 0;
    for (int i = 0; i < str.length; i++) {
        saltStr = [saltStr stringByAppendingString:[str substringWithRange:NSMakeRange(i, 1)]];
        count++;
        if (count == length) {
            int randomNum = arc4random() % 62;
            unichar salt = [randomStr characterAtIndex:randomNum];
            saltStr = [NSString stringWithFormat:@"%@%C", saltStr, salt];
            count = 0;
        }
    }
    return saltStr;
}

@end
