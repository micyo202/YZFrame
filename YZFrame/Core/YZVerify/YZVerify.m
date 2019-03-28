/************************************************************
 Class    : YZVerify.m
 Describe : 验证工具类
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-11-06
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "YZVerify.h"

@implementation YZVerify

+ (BOOL)checkVerifyCode:(NSString *)verifyCode {
    NSString *pattern = @"^\\d{6}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [predicate evaluateWithObject:verifyCode];
}

+ (BOOL)checkMobileNumber:(NSString *)number {
    NSString *pattern = @"1[345789]([0-9]){9}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [predicate evaluateWithObject:number];
}

+ (BOOL)checkPhoneNumber:(NSString *)number {
    NSString *pattern = @"^((0\\d{2,3}\\d{7,8})|(\\d{7,8})|(1[345789]\\d{9}))$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [predicate evaluateWithObject:number];
}

+ (BOOL)checkIdentityCard:(NSString *)idCardNumber {
    /*
     if (idCardNumber.length <= 0) {
     return NO;
     }
     //NSString *pattern = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
     NSString *pattern = @"(^[1-9]\\d{5}(18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$)|(^[1-9]\\d{5}\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{2}$)";
     NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
     return [predicate evaluateWithObject:idCardNumber];
     */
    
    //判断是否为空
    if (idCardNumber==nil||idCardNumber.length <= 0) {
        return NO;
    }
    
    //判断是否是18位，末尾是否是x
    NSString *pattern = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    
    if(![identityCardPredicate evaluateWithObject:idCardNumber]){
        return NO;
    }
    
    // 判断生日是否合法
    NSRange range = NSMakeRange(6, 8);
    NSString *datestr = [idCardNumber substringWithRange:range];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat : @"yyyyMMdd"];
    
    if(nil == [formatter dateFromString:datestr]){
        return NO;
    }
    
    // 判断校验位
    if(18 == idCardNumber.length) {
        NSArray *idCardWi= @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];   // 将前17位加权因子保存在数组里
        NSArray * idCardY=@[ @"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2" ];   // 这是除以11后，可能产生的11位余数、验证码，也保存成数组
        int idCardWiSum = 0;  // 用来保存前17位各自乖以加权因子后的总和
        for(int i = 0; i < 17; i++){
            idCardWiSum += [[idCardNumber substringWithRange:NSMakeRange(i, 1)] intValue]*[idCardWi[i] intValue];
        }
        
        int idCardMod = idCardWiSum%11; // 计算出校验码所在数组的位置
        NSString *idCardLast = [idCardNumber substringWithRange:NSMakeRange(17, 1)];    // 得到最后一位身份证号码
        
        // 如果等于2，则说明校验码是10，身份证号码最后一位应该是X
        if(2 == idCardMod){
            if([idCardLast isEqualToString:@"X"] || [idCardLast isEqualToString:@"x"]){
                return YES;
            }else{
                return NO;
            }
        }else{
            // 用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
            if([idCardLast intValue] == [idCardY[idCardMod] intValue]){
                return YES;
            }else{
                return NO;
            }
        }
    }
    return NO;
}

+ (BOOL)checkBankCard:(NSString *)bankCardNumber {
    if(bankCardNumber.length==0) {
        return NO;
    }
    NSString *digitsOnly = @"";
    char c;
    for (int i = 0; i < bankCardNumber.length; i++) {
        c = [bankCardNumber characterAtIndex:i];
        if (isdigit(c))
        {
            digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
        }
    }
    int sum = 0;
    int digit = 0;
    int addend = 0;
    BOOL timesTwo = false;
    for (NSInteger i = digitsOnly.length - 1; i >= 0; i--) {
        digit = [digitsOnly characterAtIndex:i] - '0';
        if (timesTwo) {
            addend = digit * 2;
            if (addend > 9) {
                addend -= 9;
            }
        } else {
            addend = digit;
        }
        sum += addend;
        timesTwo = !timesTwo;
    }
    int modulus = sum % 10;
    return modulus == 0;
}

+ (BOOL)checkPassword:(NSString *)password {
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{8,16}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [predicate evaluateWithObject:password];
}

+ (BOOL)checkEmail:(NSString *)email {
    NSString *pattern = @"^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(.[a-zA-Z0-9-]+)*.[a-zA-Z0-9]{2,6}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [predicate evaluateWithObject:email];
}

+ (BOOL)checkValidString:(NSString *)string {
    NSString *convertStr = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    if(nil != convertStr && ![@"" isEqualToString:convertStr] && convertStr.length > 0){
        return YES;
    }
    return NO;
}

+ (BOOL)checkAmount:(NSString *)amount multi:(NSInteger)multi {
    NSInteger money = [amount integerValue];
    if(0 == money%multi){
        return YES;
    }
    return NO;
}

+ (BOOL)checkAmount:(NSString *)amount min:(float)min max:(float)max {
    NSString *pattern = @"^[1-9]+\\d*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    if([predicate evaluateWithObject:amount]){
        float money = [amount floatValue];
        if(money >= min && money <= max){
            return YES;
        }
    }
    return NO;
}

+ (BOOL)checkLength:(NSString *)string min:(NSInteger)min max:(NSInteger)max {
    if(string.length >= min && string.length <= max) {
        return YES;
    }
    return NO;
}

+ (BOOL)checkNumber:(NSString *)number minLen:(NSInteger)minLen maxLen:(NSInteger)maxLen {
    NSString *pattern = @"^[0-9]*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    if([predicate evaluateWithObject:number]){
        if(number.length >= minLen && number.length <= maxLen){
            return YES;
        }
    }
    return NO;
}

+ (BOOL)checkEmoji:(NSString *)string {
    
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, string.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        const unichar high = [substring characterAtIndex: 0];
        
        // Surrogate pair (U+1D000-1F9FF)
        if (0xD800 <= high && high <= 0xDBFF) {
            const unichar low = [substring characterAtIndex: 1];
            const int codepoint = ((high - 0xD800) * 0x400) + (low - 0xDC00) + 0x10000;
            
            if (0x1D000 <= codepoint && codepoint <= 0x1F9FF){
                returnValue = YES;
            }
            
            // Not surrogate pair (U+2100-27BF)
        } else {
            if (0x2100 <= high && high <= 0x27BF){
                returnValue = YES;
            }
        }
    }];
    
    return returnValue;
}

@end
