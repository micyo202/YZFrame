/************************************************************
 Class    : YZUserDefault.h
 Describe : 轻量数据持久化对象方法
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2019-07-15
 Version  : 1.0
 Declare  : Copyright © 2019 Yanzheng. All rights reserved.
 ************************************************************/

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZUserDefault : NSObject

+ (void)saveUserDefaultObject:(id)object key:(NSString *)key;
+ (id)getUserDefaultObjectByKey:(NSString *)key;
+ (void)removeObjectWithKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
