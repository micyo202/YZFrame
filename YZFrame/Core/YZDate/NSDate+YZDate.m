/************************************************************
 Class    : NSDate+YZDate.m
 Describe : 自定义日期字符串转换任意格式
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-10-24
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "NSDate+YZDate.h"
#import "NSDateComponents+YZDate.h"

@implementation NSDate (YZDate)

- (NSInteger)year {
    NSDateComponents *components = [NSDateComponents yz_dateComponentsFromDate:self];
    return components.year;
}

- (NSInteger)month {
    NSDateComponents *components =  [NSDateComponents yz_dateComponentsFromDate:self];
    return components.month;
}

- (NSInteger)day {
    NSDateComponents *components =  [NSDateComponents yz_dateComponentsFromDate:self];
    return components.day;
}

- (NSInteger)hour {
    NSDateComponents *components =  [NSDateComponents yz_dateComponentsFromDate:self];
    return components.hour;
}

- (NSInteger)minute {
    NSDateComponents *components = [NSDateComponents yz_dateComponentsFromDate:self];
    return components.minute;
}

- (NSInteger)seconds {
    NSDateComponents *components =  [NSDateComponents yz_dateComponentsFromDate:self];
    return components.second;
}

- (NSInteger)weekday {
    NSDateComponents *components =  [NSDateComponents yz_dateComponentsFromDate:self];
    return components.weekday;
}

+ (NSDate *)yz_dateWithDateString:(NSString *)dateString {
    NSDate *date = nil;
    date = [self yz_dateWithFormat_yyyy_MM_dd_HH_mm_ss_string:dateString];
    if(date) return date;
    date = [self yz_dateWithFormat_yyyy_MM_dd_HH_mm_string:dateString];
    if(date) return date;
    date = [self yz_dateWithFormat_yyyy_MM_dd_HH_string:dateString];
    if(date) return date;
    date = [self yz_dateWithFormat_yyyy_MM_dd_string:dateString];
    if(date) return date;
    date = [self yz_dateWithFormat_yyyy_MM_string:dateString];
    if(date) return date;
    return nil;
}

+ (NSDate *)yz_dateWithFormat_yyyy_MM_dd_HH_mm_ss_string:(NSString *)string {
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date =[dateFormat dateFromString:string];
    return date;
}

+ (NSDate *)yz_dateWithFormat_yyyy_MM_dd_HH_mm_string:(NSString *)string {
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date =[dateFormat dateFromString:string];
    return date;
}

+ (NSDate *)yz_dateWithFormat_yyyy_MM_dd_HH_string:(NSString *)string {
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH"];
    NSDate *date =[dateFormat dateFromString:string];
    return date;
}

+ (NSDate *)yz_dateWithFormat_yyyy_MM_dd_string:(NSString *)string {
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *date =[dateFormat dateFromString:string];
    return date;
}

+ (NSDate *)yz_dateWithFormat_yyyy_MM_string:(NSString *)string {
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM"];
    NSDate *date =[dateFormat dateFromString:string];
    return date;
}

@end
