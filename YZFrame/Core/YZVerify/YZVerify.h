/************************************************************
 Class    : YZVerify.h
 Describe : 验证工具类
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-11-06
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <Foundation/Foundation.h>

@interface YZVerify : NSObject

+ (BOOL)checkVerifyCode:(NSString *)verifyCode;                                 // 验证短信验证码
+ (BOOL)checkMobileNumber:(NSString *)number;                                   // 验证手机号码
+ (BOOL)checkPhoneNumber:(NSString *)number;                                    // 验证手机固话号码
+ (BOOL)checkIdentityCard:(NSString *)idCardNumber;                             // 验证身份证号
+ (BOOL)checkBankCard:(NSString *)bankCardNumber;                               // 验证银行卡号
+ (BOOL)checkPassword:(NSString *) password;                                    // 验证密码格式
+ (BOOL)checkEmail:(NSString *)email;                                           // 验证邮箱格式
+ (BOOL)checkValidString:(NSString *)string;                                    // 验证字符串是否有效
+ (BOOL)checkAmount:(NSString *)amount multi:(NSInteger)multi;                  // 验证金额是否指定的倍数
+ (BOOL)checkAmount:(NSString *)amount min:(float)min max:(float)max;           // 验证金额，不得超过最大值
+ (BOOL)checkLength:(NSString *)string min:(NSInteger)min max:(NSInteger)max;   // 验证长度返回
+ (BOOL)checkNumber:(NSString *)number minLen:(NSInteger)minLen maxLen:(NSInteger)maxLen; // 验证是否为数字做长度效验
+ (BOOL)checkEmoji:(NSString *)string;                                          // 验证字符中是否有Emoji

@end
