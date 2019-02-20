//
//  TXCleanCache.h
//  TeacherWatch
//
//  Created by xtz_pioneer on 2018/8/29.
//  Copyright © 2018年 zhangxiong All rights reserved.
//

#import <Foundation/Foundation.h>
/*清理缓存完成处理程序*/
typedef void(^TXCleanCacheCompletionHandler) (void);
@interface TXCleanCache : NSObject
/*获取缓存路径*/
+ (NSString *)getCachesPath:(NSString *)fileName;
/*计算单个文件大小的方法*/
+ (long long)fileSizeAtPath:(NSString *)path;
/*计算一个文件夹大小*/
+ (float)folderSizeAtPath:(NSString *)path;
/*清空缓存方法*/
+ (void)cleanCaches:(NSString *)path;
/*根据路径返回目录或文件的大小*/
+ (double)sizeWithFilePath:(NSString *)path;
/*得到指定目录下的所有文件*/
+ (NSArray *)getAllFileNames:(NSString *)dirPath;
/*删除指定目录或文件*/
+ (BOOL)clearCachesWithFilePath:(NSString *)path;
/*清空指定目录下文件*/
+ (BOOL)clearCachesFromDirectoryPath:(NSString *)dirPath;
/*清理缓存*/
+ (void)cleanCache:(TXCleanCacheCompletionHandler)completionHandler;
/*计算整个缓存目录大小*/
+ (float)folderSizeAtPath;
@end
