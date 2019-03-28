/************************************************************
 Class    : YZFPSLabel.h
 Describe : 监测屏幕帧数工具
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2019-03-28
 Version  : 1.0
 Declare  : Copyright © 2019 Yanzheng. All rights reserved.
 ************************************************************/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Show Screen FPS...
 
 The maximum fps in OSX/iOS Simulator is 60.00.
 The maximum fps on iPhone is 59.97.
 The maxmium fps on iPad is 60.0.
 */
@interface YZFPSLabel : UILabel

@end

NS_ASSUME_NONNULL_END
