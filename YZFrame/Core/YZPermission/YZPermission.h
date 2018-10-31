/************************************************************
 Class    : YZPermission.h
 Describe : 判断并获取权限工具类
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-07-16
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreLocation/CoreLocation.h>
#import <Contacts/Contacts.h>
#import <Photos/Photos.h>
#import <EventKit/EventKit.h>

// 自定义权限状态枚举类
typedef NS_ENUM(NSUInteger, PermissionStatus){
    PermissionStatusNotDetermined = 0,    // 没有选择
    PermissionStatusRestricted = 1,       // 被限制
    PermissionStatusNoSpuuort = 2,        // 不支持
    PermissionStatusError = 3,            // 错误
    PermissionStatusDenied = 4,           // 拒绝
    PermissionStatusAuthorized = 5        // 允许
};

/*
 自定义权限状态回调block
 */
typedef void(^PermissionResultBlock)(PermissionStatus status);

@interface YZPermission : NSObject

// 相机访问权限
+ (void)checkCameraWithStatus:(PermissionResultBlock)block;
// 位置获取权限
- (void)checkLocationWithStatus:(PermissionResultBlock)block;
// 通讯录访问权限
+ (void)checkContactsWithStatus:(PermissionResultBlock)block;
// 相册访问权限
+ (void)checkPhotosWithStatus:(PermissionResultBlock)block;
// 日历访问权限
+ (void)checkCalendarsWithStatus:(PermissionResultBlock)block;

@end
