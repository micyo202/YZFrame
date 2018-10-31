/************************************************************
 Class    : UIView+YZ.m
 Describe : 自定义UIView扩展类
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-06-06
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "UIView+YZ.h"

@implementation UIView (YZ)

- (CGFloat) originX {
    return self.frame.origin.x;
}

- (void) setOriginX:(CGFloat)originX {
    self.frame = CGRectMake(originX, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)originY {
    return self.frame.origin.y;
}

- (void)setOriginY:(CGFloat)originY {
    self.frame = CGRectMake(self.frame.origin.x, originY, self.frame.size.width, self.frame.size.height);
}

@end
