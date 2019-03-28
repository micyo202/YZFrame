/************************************************************
 Class    : YZIconTitleButton.m
 Describe : 自定义文字、图片混合按钮样式，可进行图片、文字上、下、左、右排版布局
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2019-03-28
 Version  : 1.0
 Declare  : Copyright © 2019 Yanzheng. All rights reserved.
 ************************************************************/

#import "YZIconTitleButton.h"

@implementation YZIconTitleButton

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    if (!CGRectIsEmpty(self.titleRect) && !CGRectEqualToRect(self.titleRect, CGRectZero)) {
        return self.titleRect;
    }
    return [super titleRectForContentRect:contentRect];
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    if (!CGRectIsEmpty(self.imageRect) && !CGRectEqualToRect(self.imageRect, CGRectZero)) {
        return self.imageRect;
    }
    return [super imageRectForContentRect:contentRect];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
