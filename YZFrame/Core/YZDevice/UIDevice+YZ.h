/************************************************************
 Class    : UIDevice+YZ.h
 Describe : 获取设备详细信息扩展类
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-06-12
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <UIKit/UIKit.h>
#import "YZDeviceModel.h"

@interface UIDevice (YZ)

- (YZDeviceModel *)yz_deviceInfo;   // 获取设备基本信息

@end
