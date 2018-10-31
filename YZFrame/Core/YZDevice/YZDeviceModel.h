/************************************************************
 Class    : YZDeviceModel.h
 Describe : 设备信息数据模型
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-10-26
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <Foundation/Foundation.h>

@interface YZDeviceModel : NSObject

@property (nonatomic, copy) NSString *deviceIdentifier; // 设备主键（唯一）
@property (nonatomic, copy) NSString *deviceName;       // 设备名称
@property (nonatomic, copy) NSString *deviceModel;      // 设备型号
@property (nonatomic, copy) NSString *deviceInch;       // 设备尺寸
@property (nonatomic, copy) NSString *systemVersion;    // 系统版本

@end
