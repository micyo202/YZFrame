/************************************************************
 Class    : UIDevice+YZ.m
 Describe : 获取设备详细信息扩展类
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-06-12
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "UIDevice+YZ.h"
#import <sys/utsname.h>
#import "YZScreenMarcos.h"

@implementation UIDevice (YZ)

#pragma mark - 获取设备基本信息
- (YZDeviceModel *)yz_deviceInfo {
    
    // 设备主键（唯一）
    NSString *deviceIdentifier = self.identifierForVendor.UUIDString;
    // 设备名称
    NSString *deviceName = self.name;
    // 设备型号
    NSString *deviceModel = self.deviceModel;
    // 设备尺寸
    NSString *deviceInch = [NSString stringWithFormat:@"%d*%d", (int)WIDTH_SCREEN, (int)HEIGHT_SCREEN ];
    // 系统版本
    NSString *systemVersion = [NSString stringWithFormat:@"%@ %@", self.systemName, self.systemVersion];
    
    // 设备信息数据模型
    YZDeviceModel *model = [[YZDeviceModel alloc] init];
    model.deviceIdentifier = deviceIdentifier;
    model.deviceName = deviceName;
    model.deviceModel = deviceModel;
    model.deviceInch = deviceInch;
    model.systemVersion = systemVersion;
    
    return model;
}

#pragma mark - 设备详细型号
- (NSString *)deviceModel {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    NSDictionary *dict = @{
                           // iPhone
                           @"iPhone1,1" : @"iPhone 2G",
                           @"iPhone1,2" : @"iPhone 3G",
                           @"iPhone2,1" : @"iPhone 3GS",
                           @"iPhone3,1" : @"iPhone 4",
                           @"iPhone3,2" : @"iPhone 4",
                           @"iPhone3,3" : @"iPhone 4",
                           @"iPhone4,1" : @"iPhone 4s",
                           @"iPhone5,1" : @"iPhone 5",
                           @"iPhone5,2" : @"iPhone 5",
                           @"iPhone5,3" : @"iPhone 5c",
                           @"iPhone5,4" : @"iPhone 5c",
                           @"iPhone6,1" : @"iPhone 5s",
                           @"iPhone6,2" : @"iPhone 5s",
                           @"iPhone7,1" : @"iPhone 6 Plus",
                           @"iPhone7,2" : @"iPhone 6",
                           @"iPhone8,1" : @"iPhone 6s",
                           @"iPhone8,2" : @"iPhone 6s Plus",
                           @"iPhone8,4" : @"iPhone SE",
                           @"iPhone9,1" : @"iPhone 7",
                           @"iPhone9,2" : @"iPhone 7 Plus",
                           @"iPhone10,1" : @"iPhone 8",
                           @"iPhone10,4" : @"iPhone 8",
                           @"iPhone10,2" : @"iPhone 8 Plus",
                           @"iPhone10,5" : @"iPhone 8 Plus",
                           @"iPhone10,3" : @"iPhone X",
                           @"iPhone10,6" : @"iPhone X",
                           @"iPhone11,2" : @"iPhone XS",
                           @"iPhone11,4" : @"iPhone XS Max",
                           @"iPhone11,6" : @"iPhone XS Max",
                           @"iPhone11,8" : @"iPhone XR",
                           @"iPhone12,1" : @"iPhone 11",
                           @"iPhone12,3" : @"iPhone 11 Pro",
                           @"iPhone12,5" : @"iPhone 11 Pro Max",
                           // iPad
                           @"iPad1,1" : @"iPad 1",
                           @"iPad2,1" : @"iPad 2",
                           @"iPad2,2" : @"iPad 2",
                           @"iPad2,3" : @"iPad 2",
                           @"iPad2,4" : @"iPad 2",
                           @"iPad2,5" : @"iPad Mini 1",
                           @"iPad2,6" : @"iPad Mini 1",
                           @"iPad2,7" : @"iPad Mini 1",
                           @"iPad3,1" : @"iPad 3",
                           @"iPad3,2" : @"iPad 3",
                           @"iPad3,3" : @"iPad 3",
                           @"iPad3,4" : @"iPad 4",
                           @"iPad3,5" : @"iPad 4",
                           @"iPad3,6" : @"iPad 4",
                           @"iPad4,1" : @"iPad Air",
                           @"iPad4,2" : @"iPad Air",
                           @"iPad4,3" : @"iPad Air",
                           @"iPad4,4" : @"iPad Mini 2",
                           @"iPad4,5" : @"iPad Mini 2",
                           @"iPad4,6" : @"iPad Mini 2",
                           @"iPad4,7" : @"iPad mini 3",
                           @"iPad4,8" : @"iPad mini 3",
                           @"iPad4,8" : @"iPad mini 3",
                           @"iPad4,9" : @"iPad mini 4",
                           @"iPad5,2" : @"iPad mini 4",
                           @"iPad5,3" : @"iPad Air 2",
                           @"iPad5,4" : @"iPad Air 2",
                           @"iPad6,3" : @"iPad Pro (9.7-inch)",
                           @"iPad6,4" : @"iPad Pro (9.7-inch)",
                           @"iPad6,7" : @"iPad Pro (12.9-inch)",
                           @"iPad6,8" : @"iPad Pro (12.9-inch)",
                           @"iPad6,11" : @"iPad 5",
                           @"iPad6,12" : @"iPad 5",
                           @"iPad7,1" : @"iPad Pro 2(12.9-inch)",
                           @"iPad7,2" : @"iPad Pro 2(12.9-inch)",
                           @"iPad7,3" : @"iPad Pro (10.5-inch)",
                           @"iPad7,4" : @"iPad Pro (10.5-inch)",
                           @"iPad7,5" : @"iPad 6",
                           @"iPad7,6" : @"iPad 6",
                           @"iPad7,11" : @"iPad 7",
                           @"iPad7,12" : @"iPad 7",
                           @"iPad8,1" : @"iPad Pro (11-inch)",
                           @"iPad8,2" : @"iPad Pro (11-inch)",
                           @"iPad8,3" : @"iPad Pro (11-inch)",
                           @"iPad8,4" : @"iPad Pro (11-inch)",
                           @"iPad8,5" : @"iPad Pro 3 (12.9-inch)",
                           @"iPad8,6" : @"iPad Pro 3 (12.9-inch)",
                           @"iPad8,7" : @"iPad Pro 3 (12.9-inch)",
                           @"iPad8,8" : @"iPad Pro 3 (12.9-inch)",
                           @"iPad11,1" : @"iPad mini 5",
                           @"iPad11,2" : @"iPad mini 5",
                           @"iPad11,3" : @"iPad Air 3",
                           @"iPad11,4" : @"iPad Air 3",
                           // Apple Watch
                           @"Watch1,1" : @"Apple Watch",
                           @"Watch1,2" : @"Apple Watch",
                           @"Watch2,6" : @"Apple Watch Series 1",
                           @"Watch2,7" : @"Apple Watch Series 1",
                           @"Watch2,3" : @"Apple Watch Series 2",
                           @"Watch2,4" : @"Apple Watch Series 2",
                           @"Watch3,1" : @"Apple Watch Series 3",
                           @"Watch3,2" : @"Apple Watch Series 3",
                           @"Watch3,3" : @"Apple Watch Series 3",
                           @"Watch3,4" : @"Apple Watch Series 3",
                           @"Watch4,1" : @"Apple Watch Series 4",
                           @"Watch4,2" : @"Apple Watch Series 4",
                           @"Watch4,3" : @"Apple Watch Series 4",
                           @"Watch4,4" : @"Apple Watch Series 4",
                           // Simulator
                           @"i386" : @"iPhone Simulator",
                           @"x86_64" : @"iPhone Simulator"
                           };
    NSString *name = dict[platform];
    
    return name ? name : platform;
}

@end
