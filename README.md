# YZFrame

[![Build Status](https://travis-ci.org/micyo202/YZFrame.svg)](https://travis-ci.org/micyo202/YZFrame)
[![Version](https://img.shields.io/badge/version-1.3.2-yellow.svg)](https://github.com/micyo202/YZFrame)
[![Cocoapods](https://img.shields.io/badge/pod-1.10.0-green.svg)](https://cocoapods.org/?q=YZFrame)
[![Platform](https://img.shields.io/badge/platform-ios-red.svg)](https://github.com/micyo202/YZFrame)
[![Support](https://img.shields.io/badge/support-iOS12+-blue.svg)](https://www.apple.com/nl/ios)
[![License MIT](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/micyo202/YZFrame/blob/master/LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/micyo202/YZFrame.svg?style=social&label=Stars)](https://github.com/micyo202/YZFrame)
[![GitHub forks](https://img.shields.io/github/forks/micyo202/YZFrame.svg?style=social&label=Fork)](https://github.com/micyo202/YZFrame)

iOS敏捷开发类库，集成并封装一系列常用类库方法，避免重复发明轮子，提高开发效率。

### 导入工程
使用CocoaPods方式：`pod 'YZFrame'`

在使用的地方导入头文件：`#import "YZFrame.h"`即可

⚠️*注：YZFrame中已包含YYKit、MBProgressHUD、SVProgressHUD*

### 项目结构
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
├── YZUtils-- 工具类
|    ├── YZJsonUtil-- 处理json结构数据
|    ├── YZSandBoxUtil-- 沙盒数据保存删除获取等方法
|    ├── YZUserDefault-- 轻量数据持久化对象方法
|    ├── YZLocationConverterUtil-- 经纬度相关坐标转换
|    ├── YZIPAddressUtil-- 获取IP地址
├── YZAuthID-- 指纹、面容识别方法
├── YZButton-- 防重点击按钮、自定义标题图标按钮
├── YZColor-- 自定义颜色
├── YZDate-- 各种格式日期转换
├── YZDevice-- 获取设备信息
├── YZView-- 视图扩展属性
├── YZRoundedBorder-- 自定义可变的圆角和边框，某个角，多个角视图/标签
├── YZFPSLabel-- 监测FPS工具标签
```

⚠️注：详细使用方法请参考项目中Demo模块
