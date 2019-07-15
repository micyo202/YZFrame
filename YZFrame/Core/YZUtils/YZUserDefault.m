/************************************************************
 Class    : YZUserDefault.m
 Describe : 轻量数据持久化对象方法
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2019-07-15
 Version  : 1.0
 Declare  : Copyright © 2019 Yanzheng. All rights reserved.
 ************************************************************/

#import "YZUserDefault.h"

@implementation YZUserDefault

+ (void)saveUserDefaultObject:(id)object key:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:object forKey:key];
    [defaults synchronize];
}


+ (id)getUserDefaultObjectByKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id object = [defaults objectForKey:key];
    return object;
}


+ (void)removeObjectWithKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:key];
    [defaults synchronize];
}

@end
