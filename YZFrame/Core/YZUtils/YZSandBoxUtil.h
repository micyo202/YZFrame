/************************************************************
 Class    : YZSandBoxUtil.h
 Describe : 沙盒操作工具类（读、写、删）
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-06-08
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <Foundation/Foundation.h>

@interface YZSandBoxUtil : NSObject

- (NSMutableDictionary *)readDataWithFileName:(NSString *)fileName;     // 读取文件

- (BOOL)writeData:(NSDictionary *)data fileName:(NSString *)fileName;   // 写入文件

- (void)removeFileName:(NSString *)fileName;                            // 删除文件

@end
