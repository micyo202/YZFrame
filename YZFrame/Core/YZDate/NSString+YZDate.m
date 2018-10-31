/************************************************************
 Class    : NSString+YZDate.m
 Describe : 自定义日期字符串转换任意格式
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-10-24
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "NSString+YZDate.h"
#import "NSDate+YZDate.h"

@implementation NSString (YZDate)

- (NSString *)yz_formatNianYueRi {
    NSDate *date = [NSDate yz_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld年%02ld月%02ld日",date.year,date.month,date.day];
}
- (NSString *)yz_formatNianYue {
    NSDate *date = [NSDate yz_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld年%02ld月",date.year,date.month];
}
- (NSString *)yz_formatYueRi {
    NSDate *date = [NSDate yz_dateWithDateString:self];
    return [NSString stringWithFormat:@"%02ld月%02ld日",date.month,date.day];
}
- (NSString *)yz_formatNian {
    NSDate *date = [NSDate yz_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld年",date.year];
}
- (NSString *)yz_formatShiFenMiao {
    NSDate *date = [NSDate yz_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld时%02ld分%02ld秒",date.hour,date.minute,date.seconds];
}
- (NSString *)yz_formatShiFen {
    NSDate *date = [NSDate yz_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld时%02ld分",date.hour,date.minute];
}
- (NSString *)yz_formatFenMiao {
    NSDate *date = [NSDate yz_dateWithDateString:self];
    return [NSString stringWithFormat:@"%02ld分%02ld秒",date.minute,date.seconds];
}
- (NSString *)yz_format_yyyy_MM_dd {
    NSDate *date = [NSDate yz_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld-%02ld-%02ld",date.year,date.month,date.day];
}
- (NSString *)yz_format_yyyy_MM {
    NSDate *date = [NSDate yz_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld-%02ld",date.year,date.month];
}
- (NSString *)yz_format_MM_dd {
    NSDate *date = [NSDate yz_dateWithDateString:self];
    return [NSString stringWithFormat:@"%02ld-%02ld",date.month,date.day];
}
- (NSString *)yz_format_yyyy {
    NSDate *date = [NSDate yz_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld",date.year];
}
- (NSString *)yz_format_HH_mm_ss {
    NSDate *date = [NSDate yz_dateWithDateString:self];
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld",date.hour,date.minute,date.seconds];
}
- (NSString *)yz_format_HH_mm {
    NSDate *date = [NSDate yz_dateWithDateString:self];
    return [NSString stringWithFormat:@"%02ld:%02ld",date.hour,date.minute];
}
- (NSString *)yz_format_mm_ss {
    NSDate *date = [NSDate yz_dateWithDateString:self];
    return [NSString stringWithFormat:@"%02ld:%02ld",date.minute,date.seconds];
}

- (NSString *)yz_formatWeekDay {
    NSString *weekStr=nil;
    NSDate *date = [NSDate yz_dateWithDateString:self];
    switch (date.weekday) {
        case 2:
            weekStr = @"星期一";
            break;
        case 3:
            weekStr = @"星期二";
            break;
        case 4:
            weekStr = @"星期三";
            break;
        case 5:
            weekStr = @"星期四";
            break;
        case 6:
            weekStr = @"星期五";
            break;
        case 7:
            weekStr = @"星期六";
            break;
        case 1:
            weekStr = @"星期天";
            break;
        default:
            break;
    }
    return weekStr;
}

@end
