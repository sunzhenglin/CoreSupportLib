//
//  TXImageCompressor.h
//  SchoolWatchParent
//
//  Created by komlin on 2018/11/2.
//  Copyright © 2018年 Komlin. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 图片压缩 */
@interface TXImageCompressor : NSObject

/**
 *  压缩得到 目标大小的 图片Data
 *
 *  @param image 原图
 *  @param imageSize 将要显示的分辨率
 *  @param fileSize 文件大小限制
 *
 *  @return 压缩得到的图片Data
 */
+ (NSData *)compressToDataWithImage:(UIImage *)image
                          imageSize:(CGSize)imageSize
                           fileSize:(NSInteger)fileSize;

/**
 *  压缩得到 目标大小的 UIImage
 *
 *  @param image 原图
 *  @param imageSize 将要显示的分辨率
 *  @param fileSize 文件大小限制
 *
 *  @return 压缩得到的UIImage
 */
+ (UIImage *)compressToImageWithImage:(UIImage *)image
                            imageSize:(CGSize)imageSize
                             fileSize:(NSInteger)fileSize;

/**
 *  压缩得到 目标大小的 图片Datas
 *
 *  @param images 原图
 *  @param imageSize 将要显示的分辨率
 *  @param fileSize 文件大小限制
 *
 *  @return 压缩得到的图片Datas
 */
+ (NSArray<NSData*> *)compressToDatasWithImages:(NSArray<UIImage*> *)images
                          imageSize:(CGSize)imageSize
                           fileSize:(NSInteger)fileSize;

/**
 *  压缩得到 目标大小的原分辨率 图片Datas
 *
 *  @param images 原图
 *  @param fileSize 文件大小限制
 *
 *  @return 压缩得到的图片Datas
 */
+ (NSArray<NSData*> *)compressToDatasWithImages:(NSArray<UIImage*> *)images
                                       fileSize:(NSInteger)fileSize;

/**
 *  压缩得到 目标大小的 Images
 *
 *  @param images 原图
 *  @param imageSize 将要显示的分辨率
 *  @param fileSize 文件大小限制
 *
 *  @return 压缩得到的UIImage
 */
+ (NSArray<UIImage*> *)compressToImagesWithImages:(NSArray<UIImage*> *)images
                            imageSize:(CGSize)imageSize
                             fileSize:(NSInteger)fileSize;

/**
 *  压缩得到 目标大小的原分辨率 Images
 *
 *  @param images 原图
 *  @param fileSize 文件大小限制
 *
 *  @return 压缩得到的UIImage
 */
+ (NSArray<UIImage*> *)compressToImagesWithImages:(NSArray<UIImage*> *)images
                                         fileSize:(NSInteger)fileSize;

#pragma mark- 后台压缩（异步进行，不会卡住前台进程）
/**
 *  后台压缩得到 目标大小的 图片Data (使用block的结果，记得按需获取主线程)
 *
 *  @param image  原图
 *  @param imageSize  将要显示的分辨率
 *  @param fileSize  文件大小限制
 *  @param compressCompletionHandler 压缩成功后处理程序
 */
+ (void)compressToDataAtBackgroundWithImage:(UIImage *)image
                                  imageSize:(CGSize)imageSize
                                   fileSize:(NSInteger)fileSize
                  compressCompletionHandler:(void (^)(NSData *resultData))compressCompletionHandler;

/**
 *  后台压缩得到 目标大小的 图片Datas (使用block的结果，记得按需获取主线程)
 *
 *  @param images  原图
 *  @param imageSize  将要显示的分辨率
 *  @param fileSize  文件大小限制
 *  @param compressCompletionHandler 压缩成功后处理程序
 */
+ (void)compressToDatasAtBackgroundWithImages:(NSArray<UIImage*> *)images
                                    imageSize:(CGSize)imageSize
                                     fileSize:(NSInteger)fileSize
                    compressCompletionHandler:(void (^)(NSArray<NSData*> *resultDatas))compressCompletionHandler;

/**
 *  后台压缩得到 目标大小的原分辨率 图片Datas (使用block的结果，记得按需获取主线程)
 *
 *  @param images  原图
 *  @param fileSize  文件大小限制
 *  @param compressCompletionHandler 压缩成功后处理程序
 */
+ (void)compressToDatasAtBackgroundWithImages:(NSArray<UIImage*> *)images
                                     fileSize:(NSInteger)fileSize
                    compressCompletionHandler:(void (^)(NSArray<NSData*> *resultDatas))compressCompletionHandler;

/**
 *  后台压缩得到 目标大小的 UIImage (使用block的结果，记得按需获取主线程)
 *
 *  @param image 原图
 *  @param imageSize 将要显示的分辨率
 *  @param fileSize 文件大小限制
 *  @param compressCompletionHandler 压缩成功后处理程序
 */
+ (void)compressToImageAtBackgroundWithImage:(UIImage *)image
                                   imageSize:(CGSize)imageSize
                                    fileSize:(NSInteger)fileSize
                   compressCompletionHandler:(void (^)(UIImage *resultImage))compressCompletionHandler;

/**
 *  后台压缩得到 目标大小的 Images (使用block的结果，记得按需获取主线程)
 *
 *  @param images 原图集合
 *  @param imageSize 将要显示的分辨率
 *  @param fileSize 文件大小限制
 *  @param compressCompletionHandler 压缩成功后处理程序
 */
+ (void)compressToImagesAtBackgroundWithImages:(NSArray<UIImage*> *)images
                                     imageSize:(CGSize)imageSize
                                      fileSize:(NSInteger)fileSize
                     compressCompletionHandler:(void (^)(NSArray<UIImage*> *resultImages))compressCompletionHandler;

/**
 *  后台压缩得到 目标大小的原分辨率 Images (使用block的结果，记得按需获取主线程)
 *
 *  @param images 原图集合
 *  @param fileSize 文件大小限制
 *  @param compressCompletionHandler 压缩成功后处理程序
 */
+ (void)compressToImagesAtBackgroundWithImages:(NSArray<UIImage*> *)images
                                      fileSize:(NSInteger)fileSize
                     compressCompletionHandler:(void (^)(NSArray<UIImage*> *resultImages))compressCompletionHandler;

#pragma mark- 细化调用方法
/**
 只缩不压
 若scale为YES，则原图会根据size进行拉伸-会变形
 若scale为NO，则原图会根据size进行填充-不会变形
 */
+ (UIImage *)resizeImageWithImage:(UIImage *)image
                             size:(CGSize)size
                            scale:(BOOL)scale;
/**
 只压不缩
 按NSData大小压缩，返回NSData
 */
+ (NSData *)onlyCompressToDataWithImage:(UIImage *)image
                               fileSize:(NSInteger)fileSize;
/**
 只压不缩-返回UIImage
 优点：不影响分辨率，不太影响清晰度
 缺点：存在最小限制，可能压不到目标大小
 */
+ (UIImage *)onlyCompressToImageWithImage:(UIImage *)image
                                 fileSize:(NSInteger)fileSize;

@end
