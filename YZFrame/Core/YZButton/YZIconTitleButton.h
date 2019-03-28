/************************************************************
 Class    : YZIconTitleButton.h
 Describe : 自定义文字、图片混合按钮样式，可进行图片、文字上、下、左、右排版布局
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2019-03-28
 Version  : 1.0
 Declare  : Copyright © 2019 Yanzheng. All rights reserved.
 ************************************************************/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZIconTitleButton : UIButton

@property (nonatomic,assign) CGRect titleRect;
@property (nonatomic,assign) CGRect imageRect;

@end

NS_ASSUME_NONNULL_END
