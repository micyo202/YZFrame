/************************************************************
 Class    : NSDateComponents+YZDate.h
 Describe : 自定义日期字符串转换任意格式
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-10-24
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <Foundation/Foundation.h>

@interface NSDateComponents (YZDate)

+ (NSDateComponents *)yz_dateComponentsFromDate:(NSDate *)date;

@end
