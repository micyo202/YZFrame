/************************************************************
 Class    : NSString+YZDate.h
 Describe : 自定义日期字符串转换任意格式
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-10-24
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <Foundation/Foundation.h>

@interface NSString (YZDate)

//时间字符串2018-10-24 10:16:09 -> 转换

#pragma mark -年月日

/**
 *  x年x月x日
 */
@property (nonatomic, copy, readonly) NSString *yz_formatNianYueRi;

/**
 *  x年x月
 */
@property (nonatomic, copy, readonly) NSString *yz_formatNianYue;

/**
 *  x月x日
 */
@property (nonatomic, copy, readonly) NSString *yz_formatYueRi;

/**
 *  x年
 */
@property (nonatomic,copy,readonly) NSString *yz_formatNian;

/**
 *  x时x分x秒
 */
@property (nonatomic,copy,readonly) NSString *yz_formatShiFenMiao;

/**
 *  x时x分
 */
@property (nonatomic,copy,readonly) NSString *yz_formatShiFen;

/**
 *  x分x秒
 */
@property (nonatomic,copy,readonly) NSString *yz_formatFenMiao;

/**
 *  yyyy-MM-dd
 */
@property (nonatomic,copy,readonly) NSString *yz_format_yyyy_MM_dd;

/**
 *  yyyy-MM
 */
@property (nonatomic,copy,readonly) NSString *yz_format_yyyy_MM;

/**
 *  MM-dd
 */
@property (nonatomic,copy,readonly) NSString *yz_format_MM_dd;

/**
 *  yyyy
 */
@property (nonatomic,copy,readonly) NSString *yz_format_yyyy;

/**
 *  HH:mm:ss
 */
@property (nonatomic, copy, readonly) NSString *yz_format_HH_mm_ss;

/**
 *  HH:mm
 */
@property (nonatomic, copy, readonly) NSString *yz_format_HH_mm;

/**
 *  mm:ss
 */
@property (nonatomic, copy, readonly) NSString *yz_format_mm_ss;

#pragma mark - 转换为星期几
@property (nonatomic, copy, readonly) NSString *yz_formatWeekDay;

@end
