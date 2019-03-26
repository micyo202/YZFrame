# YZFrame

[![Build Status](https://travis-ci.org/micyo202/YZFrame.svg)](https://travis-ci.org/micyo202/YZFrame)
[![Version](https://img.shields.io/badge/version-1.0.5-yellow.svg)](https://github.com/micyo202/YZFrame)
[![Cocoapods](https://img.shields.io/badge/pod-v1.5.3-green.svg)](https://cocoapods.org/?q=YZFrame)
[![Platform](https://img.shields.io/badge/platform-ios-red.svg)](https://github.com/micyo202/YZFrame)
[![Support](https://img.shields.io/badge/support-iOS10+-blue.svg)](https://www.apple.com/nl/ios)
[![License MIT](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/micyo202/YZFrame/blob/master/LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/micyo202/YZFrame.svg?style=social&label=Stars)](https://github.com/micyo202/YZFrame)
[![GitHub forks](https://img.shields.io/github/forks/micyo202/YZFrame.svg?style=social&label=Fork)](https://github.com/micyo202/YZFrame)

iOS快速开发类库，集成一系列常用类库、封装相关方法，便于项目中使用，快速开发。

### 导入工程
使用CocoaPods方式：pod 'YZFrame'

在使用的地方导入头文件：#import "YZFrame.h"

### 相关说明
本类库中所有对象均已**YZ**开头，包含：

```lua
YZFrame
├── YZVerify-- 各种效验规则
├── YZPermission-- 相关权限判断开启
├── YZHandle-- 常用处理方法工具类
├── YZHUD-- 遮挡提示框（对MBProgressHUD进行扩展，二次封装）
├── YZMarcos-- 常用宏定义
├── YZEncrypt-- 加密算法
|    ├── YZBase64
|    ├── YZAES
|    ├── YZRSA
|    ├── YZMD5
|    ├── YZSalt
├── YZUtils-- 具类
|    ├── YZJsonUtil-- 处理json结构数据
|    ├── YZSandBoxUtil-- 沙盒数据保存删除获取等方法
|    ├── YZLocationConverterUtil-- 经纬度相关坐标转换
|    ├── YZIPAddressUtil-- 获取IP地址
├── YZAuthID-- 指纹、面容识别方法
├── YZButton-- 防重点击按钮
├── YZColor-- 自定义颜色
├── YZDate-- 各种格式日期转换
├── YZDevice-- 获取设备信息
├── YZView-- 视图扩展属性
```

注：相关使用方法请参考项目中Demo模块

### Demo包含以下相关代码：
* AvoidCrash防止 NSArray、NSDictionary 崩溃闪退
* UIAlertController+Blocks弹框提示
* CustomIOSAlertView自定义弹出对话视图
* LCActionSheet底部弹出选择列表组件
* ActionSheetPicker-3.0底部弹出选择器
* JDStatusBarNotification状态栏提醒
* YBPopupMenu气泡pop菜单
* MJRefresh下拉刷新、上拉加载
* YYKit一系列工具类组件
* SDWebImage网络图片加载
* SDCycleScrollView轮播图
