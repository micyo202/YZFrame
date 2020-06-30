/************************************************************
 Class    : YZPermission.m
 Describe : 判断并获取权限工具类
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-07-16
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "YZPermission.h"
#import "YZUtilsMarcos.h"
#import <UIKit/UIKit.h>

@interface YZPermission() <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;   // 位置管理器
@property (nonatomic, copy) void (^kCLAuthorizationStatusBlock)(PermissionStatus status);  // 位置权限回调block

@end

@implementation YZPermission

#pragma mark - 相机访问权限
+ (void)checkCameraWithStatus:(PermissionResultBlock)block {
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        
        if (AVAuthorizationStatusNotDetermined == status) {// 未选择
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    [self executePermissionCallBack:block status:PermissionStatusAuthorized];
                }else{
                    [self executePermissionCallBack:block status:PermissionStatusDenied];
                }
            }];
        } else if(AVAuthorizationStatusRestricted == status) {// 受限制
            [self executePermissionCallBack:block status:PermissionStatusRestricted];
        } else if(AVAuthorizationStatusDenied == status) {// 拒绝
            [self executePermissionCallBack:block status:PermissionStatusDenied];
        } else {// 允许
            [self executePermissionCallBack:block status:PermissionStatusAuthorized];
        }
    } else {// 不支持
        [self executePermissionCallBack:block status:PermissionStatusNoSpuuort];
    }
}

#pragma mark - 位置访问权限
- (void)checkLocationWithStatus:(PermissionResultBlock)block {
    BOOL isLocationServicesEnabled = [CLLocationManager locationServicesEnabled];
    if (!isLocationServicesEnabled) {
        DLog(@"定位服务不可用，例如定位没有打开...");
    }else{
        CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
        
        if(kCLAuthorizationStatusNotDetermined == status){// 未选择
            self.locationManager = [[CLLocationManager alloc] init];
            self.locationManager.delegate = self;
            
            // 两种定位模式：
            //[self.locationManager requestAlwaysAuthorization];
            [self.locationManager requestWhenInUseAuthorization];
            
            WeakSelf(self)
            [self setKCLAuthorizationStatusBlock:^(PermissionStatus status) {
                StrongSelf(self)
                [self executePermissionCallBack:block status:status];
            }];
            
        } else if(kCLAuthorizationStatusRestricted == status) {// 受限制
            [self executePermissionCallBack:block status:PermissionStatusRestricted];
        } else if(kCLAuthorizationStatusDenied == status) {// 拒绝
            [self executePermissionCallBack:block status:PermissionStatusDenied];
        } else {// 允许
            [self executePermissionCallBack:block status:PermissionStatusAuthorized];
        }
    }
}

#pragma mark - <CLLocationManagerDelegate> 位置信息代理方法
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    if (self.kCLAuthorizationStatusBlock) {
        
        if(status == kCLAuthorizationStatusNotDetermined){// 未选择
            self.kCLAuthorizationStatusBlock(PermissionStatusNotDetermined);
        }else if(status == kCLAuthorizationStatusRestricted){// 受限制
            self.kCLAuthorizationStatusBlock(PermissionStatusRestricted);
        }else if(status == kCLAuthorizationStatusDenied){// 拒绝
            self.kCLAuthorizationStatusBlock(PermissionStatusDenied);
        }else{// 允许
            self.kCLAuthorizationStatusBlock(PermissionStatusAuthorized);
        }
        
    }
}

#pragma mark - 通讯录访问权限
+ (void)checkContactsWithStatus:(PermissionResultBlock)block {
    
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    
    if (status == CNAuthorizationStatusNotDetermined) {
        
        CNContactStore *contactStore = [[CNContactStore alloc] init];
        if (nil == contactStore) {// 不支持
            [self executePermissionCallBack:block status:PermissionStatusNoSpuuort];
        }
        [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (error) {// 错误
                DLog(@"error: %@", error);
                [self executePermissionCallBack:block status:PermissionStatusError];
            }else{
                if (granted) {
                    [self executePermissionCallBack:block status:PermissionStatusAuthorized];
                }else{
                    [self executePermissionCallBack:block status:PermissionStatusDenied];
                }
            }
        }];
        
    } else if(status == CNAuthorizationStatusRestricted) {// 受限制
        [self executePermissionCallBack:block status:PermissionStatusRestricted];
    } else if(status == CNAuthorizationStatusDenied) {// 拒绝
        [self executePermissionCallBack:block status:PermissionStatusDenied];
    } else {// 允许
        [self executePermissionCallBack:block status:PermissionStatusAuthorized];
    }
}

#pragma mark - 相册访问权限
+ (void)checkPhotosWithStatus:(PermissionResultBlock)block {
    
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    
    if (PHAuthorizationStatusNotDetermined == status) {// 未选择
        
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (PHAuthorizationStatusRestricted == status) {
                [self executePermissionCallBack:block status:PermissionStatusRestricted];
            } else if (PHAuthorizationStatusDenied == status) {
                [self executePermissionCallBack:block status:PermissionStatusDenied];
            } else {
                [self executePermissionCallBack:block status:PermissionStatusAuthorized];
            }
        }];
        
    } else if (status == PHAuthorizationStatusRestricted) {// 受限制
        [self executePermissionCallBack:block status:PermissionStatusRestricted];
    } else if (status == PHAuthorizationStatusDenied) {// 拒绝
        [self executePermissionCallBack:block status:PermissionStatusDenied];
    } else {// 允许
        [self executePermissionCallBack:block status:PermissionStatusAuthorized];
    }
}

#pragma mark - 日历访问权限
+ (void)checkCalendarsWithStatus:(PermissionResultBlock)block {
    
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];
    
    if (EKAuthorizationStatusNotDetermined == status) {// 未选择
        
        EKEventStore *store = [[EKEventStore alloc] init];
        
        if (nil == store ) {// 不支持
            [self executePermissionCallBack:block status:PermissionStatusNoSpuuort];
        }else{
            [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError * _Nullable error) {
                if (error) {// 错误
                    DLog(@"error:%@",error);
                    [self executePermissionCallBack:block status:PermissionStatusError];
                }
                if (granted) {
                    [self executePermissionCallBack:block status:PermissionStatusAuthorized];
                }else{
                    [self executePermissionCallBack:block status:PermissionStatusDenied];
                }
            }];
        }
    } else if (EKAuthorizationStatusRestricted == status) {// 受限制
        [self executePermissionCallBack:block status:PermissionStatusRestricted];
    } else if (EKAuthorizationStatusDenied == status) {// 拒绝
        [self executePermissionCallBack:block status:PermissionStatusDenied];
    } else {// 允许
        [self executePermissionCallBack:block status:PermissionStatusAuthorized];
    }
}

#pragma mark - 自定义回调block
+ (void)executePermissionCallBack:(PermissionResultBlock)block status:(PermissionStatus)status {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (block) {
            block(status);
        }
    });
}

- (void)executePermissionCallBack:(PermissionResultBlock)block status:(PermissionStatus)status {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (block) {
            block(status);
        }
    });
}

@end
