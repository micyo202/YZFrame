/************************************************************
 Class    : UIButton+YZ.m
 Describe : UIButton扩展类，用于防止按钮重复点击
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-06-16
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "UIButton+YZ.h"
#import <objc/runtime.h>

@interface UIButton()

@property (nonatomic, assign) NSTimeInterval yz_acceptEventTime;

@end

@implementation UIButton (YZ)

// 在load时执行hook
+ (void)load{
    Method systemMethod = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    SEL sysSEL = @selector(sendAction:to:forEvent:);
    
    Method customMethod = class_getInstanceMethod(self, @selector(yz_sendAction:to:forEvent:));
    SEL customSEL = @selector(yz_sendAction:to:forEvent:);
    
    //添加方法 语法：BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types) 若添加成功则返回No
    // cls：被添加方法的类  name：被添加方法方法名  imp：被添加方法的实现函数  types：被添加方法的实现函数的返回值类型和参数类型的字符串
    BOOL didAddMethod = class_addMethod(self, sysSEL, method_getImplementation(customMethod), method_getTypeEncoding(customMethod));
    
    //如果系统中该方法已经存在了，则替换系统的方法  语法：IMP class_replaceMethod(Class cls, SEL name, IMP imp,const char *types)
    if (didAddMethod) {
        class_replaceMethod(self, customSEL, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
    }else{
        method_exchangeImplementations(systemMethod, customMethod);
    }
}

- (NSTimeInterval )yz_acceptEventInterval{
    return [objc_getAssociatedObject(self, "UIControl_acceptEventInterval") doubleValue];
}

- (void)setYz_acceptEventInterval:(NSTimeInterval)yz_acceptEventInterval{
    objc_setAssociatedObject(self, "UIControl_acceptEventInterval", @(yz_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval )yz_acceptEventTime{
    return [objc_getAssociatedObject(self, "UIControl_acceptEventTime") doubleValue];
}

- (void)setYz_acceptEventTime:(NSTimeInterval)yz_acceptEventTime{
    objc_setAssociatedObject(self, "UIControl_acceptEventTime", @(yz_acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)yz_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    
    // 如果想要设置统一的间隔时间，可以在此处加上以下几句
    // 值得提醒一下：如果这里设置了统一的时间间隔，会影响第三方密码键盘PasGuardLib组件的正常使用
    // 不建议打开此属性统一设置，建议使用的时候手动添加该属性间隔时间：btn.yz_acceptEventInterval = 0.5f
    /*
    if (self.yz_acceptEventInterval <= 0) {
        // 如果没有自定义时间间隔，则默认为0.5秒
        self.yz_acceptEventInterval = 0.5f;
    }
    */
    
    // 是否小于设定的时间间隔
    BOOL needSendAction = (NSDate.date.timeIntervalSince1970 - self.yz_acceptEventTime >= self.yz_acceptEventInterval);
    
    // 更新上一次点击时间戳
    if (self.yz_acceptEventInterval > 0) {
        self.yz_acceptEventTime = NSDate.date.timeIntervalSince1970;
    }
    
    // 两次点击的时间间隔小于设定的时间间隔时，才执行响应事件
    if (needSendAction) {
        [self yz_sendAction:action to:target forEvent:event];
    }
    
}

@end
