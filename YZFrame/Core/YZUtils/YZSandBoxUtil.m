/************************************************************
 Class    : YZSandBoxUtil.m
 Describe : 沙盒操作工具类（读、写、删）
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-06-08
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "YZSandBoxUtil.h"
#import "YZUtilsMarcos.h"

@implementation YZSandBoxUtil

#pragma mark - 沙盒操作（SandBox）
#pragma mark 读取文件数据
- (NSMutableDictionary *)readDataWithFileName:(NSString *)fileName{
    
    NSString *dataFile = [self getFile:fileName];
    //读取所有内容
    //NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:dataFile];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:dataFile];
    //DLog(@"完整内容:\n%@",dict);
    
    return dict;
}

#pragma mark 将数据写入文件
- (BOOL)writeData:(NSDictionary *)data fileName:(NSString *)fileName{
    
    NSString *dataFile = [self getFile:fileName];
    
    if (YES==[self isFileNeedCreate:dataFile]) {
        DLog(@"%@文件原先不存在，现已新建空文件！", fileName);
    }else{
        DLog(@"%@文件已存在，无需创建！", fileName);
    }
    
    //数据写入（完全覆盖）
    return [data writeToFile:dataFile atomically:YES];
}

#pragma mark 删除文件
- (void)removeFileName:(NSString *)fileName{
    
    NSString *dataFile = [self getFile:fileName];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isFile = [fileManager fileExistsAtPath:dataFile];// 判断文件是否存在
    
    if(isFile){
        [fileManager removeItemAtPath:dataFile error:nil];// 删除对应文件
    }else{
        DLog(@"%@文件不存在，无需进行删除", fileName);
    }
}

#pragma mark - 该类的工具方法
#pragma mark 获取路径
- (NSString *)getPath{
    // 获取Documents目录
    NSArray *documentsPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取Documents文件夹目录,第一个参数是说明获取Doucments文件夹目录，第二个参数说明是在当前应用沙盒中获取，所有应用沙盒目录组成一个数组结构的数据存放
    NSString *documentsPath = [documentsPaths objectAtIndex:0];
    //DLog(@"Documents目录：%@",documentsPath);
    
    return documentsPath;
}

#pragma mark 文件是否需要创建
- (BOOL)isFileNeedCreate:(NSString *)filePath{
    if ( NO == [[NSFileManager defaultManager] fileExistsAtPath:filePath] ){
        return [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    }
    return NO;
}

#pragma mark 获取完整的沙盒文件名
- (NSString *)getFile:(NSString *)fileName{
    //获取应用程序沙盒的Documents目录
    NSString *documentsPath = [self getPath];
    
    //得到完整的文件名（本地沙盒plist文件）
    NSString *file = [documentsPath stringByAppendingPathComponent:fileName];
    
    return file;
}

@end
