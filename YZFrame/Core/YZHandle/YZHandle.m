/************************************************************
 Class    : YZHandle.m
 Describe : 常用方法处理类
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-06-12
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "YZHandle.h"
#import "YZUtilsMarcos.h"

@implementation YZHandle

#pragma mark - 将 NSData 转换成 16 进制字符串
+ (NSString *)convertDataToHexStr:(NSData *)data {
    if (!data || [data length] == 0) {
        return @"";
    }
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [string appendString:hexStr];
            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }
    }];
    
    return string;
}

#pragma mark - 将 16 进制字符串转换成 NSData
+ (NSData *)convertHexStrToData:(NSString *)str {
    if (!str || [str length] == 0) {
        return nil;
    }
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:20];
    NSRange range;
    if ([str length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [str length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    return hexData;
}

#pragma mark - 将字符串指定位置隐藏为*
+ (NSString *)hideStr:(NSString *)str range:(NSRange)range {
    if(nil == str || str.length < 2)
        return @"";
    NSMutableString *mutableStr = [NSMutableString stringWithString:str];
    NSString *replaceStr = @"*";
    for(int i = 1; i < range.length; i++){
        replaceStr = [NSString stringWithFormat:@"*%@", replaceStr];
    }
    [mutableStr replaceCharactersInRange:range withString:replaceStr];
    NSString *hideStr = [NSString stringWithFormat:@"%@", mutableStr];
    return hideStr;
}

#pragma mark - 将数字转化为货币格式的字符串（每隔三位一个逗号，保留两位小数）
+ (NSString *)moneyStringWithMoneyNumber:(float)moneyNum {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    // 设置格式
    [numberFormatter setPositiveFormat:@"###,##0.00;"];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:moneyNum]];
    return formattedNumberString;
}

#pragma mark - 银行卡号转换，4位一个空格
+ (NSString *)bankCardNumWithString:(NSString *)string {
    
    NSString *bankCardNum = string;
    
    NSInteger size = (bankCardNum.length / 4);
    
    NSMutableArray *bankCardNumArray = [[NSMutableArray alloc] init];
    for (int n = 0;n < size; n++){
        [bankCardNumArray addObject:[bankCardNum substringWithRange:NSMakeRange(n*4, 4)]];
    }
    [bankCardNumArray addObject:[bankCardNum substringWithRange:NSMakeRange(size*4, (bankCardNum.length % 4))]];
    bankCardNum = [bankCardNumArray componentsJoinedByString:@" "];
    return bankCardNum;
}

#pragma mark - 去掉字符串中特殊字符
+ (NSString *)replaceSpecialCharsOfString:(NSString *)string {
    if(string){
        string = [string stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@"|" withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@"," withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@"，" withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@"." withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@"。" withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@"?" withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@"？" withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@":" withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@"：" withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@";" withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@"；" withString:@""];
    }
    return string;
}

#pragma mark - 中文转换为拼音(传入汉字字符串, 返回大写拼音全拼)
+ (NSString *)pinYinWithChineseStr:(NSString *)chineseStr {
    NSString *result = nil;
    if (chineseStr.length){
        NSMutableString *pinYin = [[NSMutableString alloc] initWithString:chineseStr];
        // 先转换为带声调的拼音
        if (CFStringTransform((__bridge CFMutableStringRef)pinYin, 0, kCFStringTransformMandarinLatin, NO)) {
            DLog(@"pinYin: %@", pinYin);
        }
        // 再转换为不带声调的拼音
        if (CFStringTransform((__bridge CFMutableStringRef)pinYin, 0, kCFStringTransformStripDiacritics, NO)) {
            DLog(@"pinYin: %@", pinYin);
            // 再去除空格，将拼音连在一起
            NSString *pinYinStr = [NSString stringWithString:pinYin];
            // 去除掉首尾的空白字符和换行字符
            pinYinStr = [pinYinStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            // 获取拼音首字母
            NSArray *array = [pinYinStr componentsSeparatedByString:@" "];      // 根据空格截取字符串为数组
            NSString *firstPinYinStr = @"";
            for(NSString *pinYin in array){
                firstPinYinStr = [firstPinYinStr stringByAppendingFormat:@"%@", [pinYin substringToIndex:1]];
            }
            DLog(@"firstPinYinStr: %@", firstPinYinStr);
            
            // 去除掉其它位置的空白字符
            //pinYinStr = [pinYinStr stringByReplacingOccurrencesOfString:@" " withString:@""];
            result = [NSString stringWithFormat:@"%@|%@", firstPinYinStr, pinYinStr];
            // 转换大写
            result = [result uppercaseString];
        }
    }
    
    return result;
}

#pragma mark - 绘制虚线
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    
    //  设置虚线颜色为
    [shapeLayer setStrokeColor:lineColor.CGColor];
    
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
    
}

#pragma mark - 计算文本所需的宽高
+ (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *dict = @{NSFontAttributeName : font};
    // 如果将来计算的文字的范围超出了指定的范围,返回的就是指定的范围
    // 如果将来计算的文字的范围小于指定的范围, 返回的就是真实的范围
    CGSize size = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

#pragma mark - 计算文本在label中的高度
+ (CGFloat)heightWithText:(NSString *)text width:(CGFloat)width font:(UIFont *)font {
    static UILabel *stringLabel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{    //生成一个同于计算文本高度的label
        stringLabel = [UILabel new];
        stringLabel.numberOfLines = 0;
    });
    stringLabel.font = font;
    stringLabel.attributedText = getAttributedText(text);
    return [stringLabel sizeThatFits:CGSizeMake(width, MAXFLOAT)].height;
}
#pragma mark - 计算文本在label中需要的高度
NSMutableAttributedString *getAttributedText(NSString *value) {//这里调整富文本的段落格式
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:value];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:8.0];
    // [paragraphStyle setParagraphSpacing:11]; //调整段间距
    // [paragraphStyle setHeadIndent:75.0];//段落整体缩进
    // [paragraphStyle setFirstLineHeadIndent:.0];//首行缩进
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [value length])];
    return attributedString;
}

#pragma mark - 获取当前最顶端展示的视图控制器
#pragma mark 获取当前显示的视图（主方法）
+ (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[WINDOW rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

#pragma mark 获取当前展示的视图控制器（递归调用方法）
+ (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

@end
