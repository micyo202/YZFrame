/************************************************************
 Class    : YZColorMarcos.h
 Describe : 颜色宏
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-10-26
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#ifndef YZColorMarcos_h
#define YZColorMarcos_h

#pragma mark - 颜色方法
#define RgbColor(r, g, b, a)    [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define HexColor(hex, a)        [UIColor colorWithHexString:hex alpha:a]
#define RandomColor             RgbColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#endif /* YZColorMarcos_h */
