//
//  TXCleanCache.h
//  TeacherWatch
//
//  Created by xtz_pioneer on 2018/8/29.
//  Copyright © 2018年 zhangxiong All rights reserved.
//

#import "TXCleanCache.h"

@implementation TXCleanCache

/*获取缓存路径*/
+ (NSString *)getCachesPath:(NSString *)fileName{
    //获取完整路径
    NSString *path = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject;
    NSString *cachesPath = [path stringByAppendingPathComponent:fileName];
    return cachesPath;
}

/*计算单个文件大小的方法*/
+ (long long)fileSizeAtPath:(NSString *)path{
    //创建一个文件管理者
    NSFileManager *manger = [NSFileManager defaultManager];
    if ([manger fileExistsAtPath:path]) {
        return [[manger attributesOfItemAtPath:path error:nil] fileSize];
    }
    return 0;
}

/*计算一个文件夹大小*/
+ (float)folderSizeAtPath:(NSString *)path{
    //创建文件管理者
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:path]) {
        return 0;
    }
    //根据路径获取文件夹里面的元素的集合
    //获取集合类型的枚举器
    NSEnumerator *enumerator = [[manager subpathsAtPath:path] objectEnumerator];
    //每次遍历得到的文件名
    NSString *fileName = [NSString string];
    //文件夹大小
    float folderSize = 0;
    while ((fileName = [enumerator nextObject]) != nil) {
        NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:absolutePath];
    }
    return folderSize / (1024.0 * 1024.0);
}

/*清空缓存方法*/
+ (void)cleanCaches:(NSString *)path{
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:path]) {
        NSArray *fileNameArray = [manager subpathsAtPath:path];
        for (NSString *fileName in fileNameArray) {
            //拼接绝对路径
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            //通过管理者删除文件
            [manager removeItemAtPath:absolutePath error:nil];
        }
    }
}

/*根据路径返回目录或文件的大小*/
+ (double)sizeWithFilePath:(NSString *)path{
    // 1.获得文件夹管理者
    NSFileManager *manger = [NSFileManager defaultManager];
    // 2.检测路径的合理性
    BOOL dir = NO;
    BOOL exits = [manger fileExistsAtPath:path isDirectory:&dir];
    if (!exits) return 0;
    // 3.判断是否为文件夹
    if (dir) { // 文件夹, 遍历文件夹里面的所有文件
        // 这个方法能获得这个文件夹下面的所有子路径(直接\间接子路径)
        NSArray *subpaths = [manger subpathsAtPath:path];
        int totalSize = 0;
        for (NSString *subpath in subpaths) {
            NSString *fullsubpath = [path stringByAppendingPathComponent:subpath];
            BOOL dir = NO;
            [manger fileExistsAtPath:fullsubpath isDirectory:&dir];
            if (!dir) { // 子路径是个文件
                NSDictionary *attrs = [manger attributesOfItemAtPath:fullsubpath error:nil];
                totalSize += [attrs[NSFileSize] intValue];
            }
        }
        return totalSize / (1024 * 1024.0);
    } else { // 文件
        NSDictionary *attrs = [manger attributesOfItemAtPath:path error:nil];
        return [attrs[NSFileSize] intValue] / (1024.0 * 1024.0);
    }
}

/*得到指定目录下的所有文件*/
+ (NSArray *)getAllFileNames:(NSString *)dirPath{
    NSArray *files = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:dirPath error:nil];
    return files;
}

/*删除指定目录或文件*/
+ (BOOL)clearCachesWithFilePath:(NSString *)path{
    NSFileManager *mgr = [NSFileManager defaultManager];
    return [mgr removeItemAtPath:path error:nil];
}

/*清空指定目录下文件*/
+ (BOOL)clearCachesFromDirectoryPath:(NSString *)dirPath{
    //获得全部文件数组
    NSArray *fileAry =  [self getAllFileNames:dirPath];
    //遍历数组
    BOOL flag = NO;
    for (NSString *fileName in fileAry) {
        NSString *filePath = [dirPath stringByAppendingPathComponent:fileName];
        flag = [self clearCachesWithFilePath:filePath];
        if (!flag)
            break;
    }
    return flag;
}

/*清理缓存*/
+ (void)cleanCache:(TXCleanCacheCompletionHandler)completionHandler{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //文件路径
        NSString *cachesDirectoryPath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        [self cleanCaches:cachesDirectoryPath];
        //返回主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completionHandler) completionHandler();
        });
    });
}

/*计算整个缓存目录大小*/
+ (float)folderSizeAtPath{
    NSString *cachesDirectoryPath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    return  [self folderSizeAtPath:cachesDirectoryPath];
}



@end
