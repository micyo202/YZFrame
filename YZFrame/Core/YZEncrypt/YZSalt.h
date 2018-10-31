/************************************************************
 Class    : YZSalt.h
 Describe : Salt 加盐类
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-08-28
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <Foundation/Foundation.h>

@interface YZSalt : NSObject

// 密文加盐（length: 加盐粒度）
+ (NSString *)encryptString:(NSString *)str length:(NSInteger)length;

@end
