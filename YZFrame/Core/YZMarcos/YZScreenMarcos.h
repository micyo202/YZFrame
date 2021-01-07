/************************************************************
 Class    : YZScreenMarcos.h
 Describe : 屏幕尺寸宏
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-10-26
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#ifndef YZScreenMarcos_h
#define YZScreenMarcos_h

#pragma mark - 设备屏幕尺寸
#define FRAME_SCREEN            UIScreen.mainScreen.bounds
#define SIZE_SCREEN             UIScreen.mainScreen.bounds.size
#define WIDTH_SCREEN            UIScreen.mainScreen.bounds.size.width
#define HEIGHT_SCREEN           UIScreen.mainScreen.bounds.size.height
#define HEIGTH_STATUS_BAR       UIApplication.sharedApplication.statusBarFrame.size.height
//#define HEIGTH_STATUS_BAR   UIApplication.sharedApplication.windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height
#define HEIGHT_NAVIGATION_BAR   44.f
#define HEIGHT_TAB_BAR          (UIApplication.sharedApplication.statusBarFrame.size.height > 20 ? 83 : 49)
#define HEIGHT_TOP              (HEIGTH_STATUS_BAR + HEIGHT_NAVIGATION_BAR)
#define HEIGHT_SAFE_AREA_TOP    88.f
#define HEIGHT_SAFE_AREA        690.f
#define HEIGHT_SAFE_AREA_BOTTOM 34.f

#pragma mark - iPhone全屏系列（包含：iPhoneX系列、iPhone11系列、iPhone12系列）
#define iPhone_Full_Screen_Series  (WIDTH_SCREEN == 375.f && HEIGHT_SCREEN == 812.f) || (WIDTH_SCREEN == 414.f && HEIGHT_SCREEN == 896.f) || (WIDTH_SCREEN == 390.f && HEIGHT_SCREEN == 844.f) || (WIDTH_SCREEN == 428.f && HEIGHT_SCREEN == 926.f)

#endif /* YZScreenMarcos_h */
