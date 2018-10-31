/************************************************************
 Class    : NSDate+YZDate.h
 Describe : 自定义日期字符串转换任意格式
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-10-24
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <Foundation/Foundation.h>

@interface NSDate (YZDate)

@property (nonatomic, assign, readonly) NSInteger year;
@property (nonatomic, assign, readonly) NSInteger month;
@property (nonatomic, assign, readonly) NSInteger day;
@property (nonatomic, assign, readonly) NSInteger hour;
@property (nonatomic, assign, readonly) NSInteger minute;
@property (nonatomic, assign, readonly) NSInteger seconds;
@property (nonatomic, assign, readonly) NSInteger weekday;

+ (NSDate *)yz_dateWithDateString:(NSString *)dateString;

+ (NSDate *)yz_dateWithFormat_yyyy_MM_dd_HH_mm_ss_string:(NSString *)string;
+ (NSDate *)yz_dateWithFormat_yyyy_MM_dd_HH_mm_string:(NSString *)string;
+ (NSDate *)yz_dateWithFormat_yyyy_MM_dd_HH_string:(NSString *)string;
+ (NSDate *)yz_dateWithFormat_yyyy_MM_dd_string:(NSString *)string;
+ (NSDate *)yz_dateWithFormat_yyyy_MM_string:(NSString *)string;

@end
