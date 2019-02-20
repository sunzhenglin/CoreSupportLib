//
//  TXImageCompressor.m
//  SchoolWatchParent
//
//  Created by komlin on 2018/11/2.
//  Copyright © 2018年 Komlin. All rights reserved.
//

#import "TXImageCompressor.h"

@implementation TXImageCompressor

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
                           fileSize:(NSInteger)fileSize{
    NSLog(@"正在压缩图片...");
    UIImage *oldIMG = image;
    UIImage *thumIMG = [self resizeImageWithImage:oldIMG
                                             size:imageSize
                                            scale:NO];
    NSData  *outIMGData = [self onlyCompressToDataWithImage:thumIMG
                                                   fileSize:(fileSize*1024)];
    CGSize scalesize = imageSize;
    //如果压缩后还是无法达到文件大小，则降低分辨率，继续压缩
    while (outIMGData.length>(fileSize*1024)) {
        scalesize = CGSizeMake(scalesize.width*0.8, scalesize.height*0.8);
        thumIMG = [self resizeImageWithImage:oldIMG
                                        size:scalesize
                                       scale:NO];
        outIMGData = [self onlyCompressToDataWithImage:thumIMG
                                              fileSize:(fileSize*1024)];
    }
    NSLog(@"压缩完成");
    return outIMGData;
}

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
                             fileSize:(NSInteger)fileSize{
    NSLog(@"正在压缩图片...");
    UIImage *oldIMG = image;
    UIImage *thumIMG = [self resizeImageWithImage:oldIMG
                                             size:imageSize
                                            scale:NO];
    UIImage *outIMG = [self onlyCompressToImageWithImage:thumIMG
                                                fileSize:(fileSize*1024)];
    NSData * newimageData = UIImageJPEGRepresentation(outIMG,1);
    CGSize scalesize = imageSize;
    //如果压缩后还是无法达到文件大小，则降低分辨率，继续压缩
    while ([newimageData length]>(fileSize*1024)) {
        scalesize = CGSizeMake(scalesize.width*0.8, scalesize.height*0.8);
        thumIMG = [self resizeImageWithImage:outIMG
                                        size:scalesize
                                       scale:NO];
        outIMG = [self onlyCompressToImageWithImage:thumIMG
                                           fileSize:(fileSize*1024)];
        newimageData = UIImageJPEGRepresentation(outIMG,1);
    }
    NSLog(@"压缩完成");
    return outIMG;
}

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
                                       fileSize:(NSInteger)fileSize{
    if (!images || images.count<=0) return nil;
    NSMutableArray *newIMGDatas=[NSMutableArray array];
    for (int index=0; index<images.count; index++) {
        UIImage *image=images[index];
        [newIMGDatas addObject:[self compressToDataWithImage:image imageSize:imageSize fileSize:fileSize]];
    }
    return newIMGDatas;
}

/**
 *  压缩得到 目标大小的原分辨率 图片Datas
 *
 *  @param images 原图
 *  @param fileSize 文件大小限制
 *
 *  @return 压缩得到的图片Datas
 */
+ (NSArray<NSData*> *)compressToDatasWithImages:(NSArray<UIImage*> *)images
                                       fileSize:(NSInteger)fileSize{
    if (!images || images.count<=0) return nil;
    NSMutableArray *newIMGDatas=[NSMutableArray array];
    for (int index=0; index<images.count; index++) {
        UIImage *image=images[index];
        [newIMGDatas addObject:[self compressToDataWithImage:image imageSize:image.size fileSize:fileSize]];
    }
    return newIMGDatas;
}

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
                                         fileSize:(NSInteger)fileSize{
    if (!images || images.count<=0) return nil;
    NSMutableArray *newImages=[NSMutableArray array];
    for (int index=0; index<images.count; index++) {
        UIImage *image=images[index];
        [newImages addObject:[self compressToImageWithImage:image imageSize:imageSize fileSize:fileSize]];
    }
    return newImages;
}

/**
 *  压缩得到 目标大小的原分辨率 Images
 *
 *  @param images 原图
 *  @param fileSize 文件大小限制
 *
 *  @return 压缩得到的UIImage
 */
+ (NSArray<UIImage*> *)compressToImagesWithImages:(NSArray<UIImage*> *)images
                                         fileSize:(NSInteger)fileSize{
    if (!images || images.count<=0) return nil;
    NSMutableArray *newImages=[NSMutableArray array];
    for (int index=0; index<images.count; index++) {
        UIImage *image=images[index];
        [newImages addObject:[self compressToImageWithImage:image imageSize:image.size fileSize:fileSize]];
    }
    return newImages;
}

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
                  compressCompletionHandler:(void (^)(NSData *resultData))compressCompletionHandler{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *newIMGData = [TXImageCompressor compressToDataWithImage:image
                                                              imageSize:imageSize
                                                               fileSize:fileSize];
        compressCompletionHandler(newIMGData);
    });
}

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
                    compressCompletionHandler:(void (^)(NSArray<NSData*> *resultDatas))compressCompletionHandler{
    if (!images || images.count<=0) return;
    NSMutableArray *resultDatas=[NSMutableArray array];
    for (int index=0; index<images.count; index++) {
        UIImage *image=images[index];
        [self compressToDataAtBackgroundWithImage:image imageSize:imageSize fileSize:fileSize compressCompletionHandler:^(NSData *resultData) {
            [resultDatas addObject:resultData];
            if (resultDatas.count==images.count) compressCompletionHandler(resultDatas);
        }];
    }
}

/**
 *  后台压缩得到 目标大小的原分辨率 图片Datas (使用block的结果，记得按需获取主线程)
 *
 *  @param images  原图
 *  @param fileSize  文件大小限制
 *  @param compressCompletionHandler 压缩成功后处理程序
 */
+ (void)compressToDatasAtBackgroundWithImages:(NSArray<UIImage*> *)images
                                     fileSize:(NSInteger)fileSize
                    compressCompletionHandler:(void (^)(NSArray<NSData*> *resultDatas))compressCompletionHandler{
    if (!images || images.count<=0) return;
    NSMutableArray *resultDatas=[NSMutableArray array];
    for (int index=0; index<images.count; index++) {
        UIImage *image=images[index];
        [self compressToDataAtBackgroundWithImage:image imageSize:image.size fileSize:fileSize compressCompletionHandler:^(NSData *resultData) {
            [resultDatas addObject:resultData];
            if (resultDatas.count==images.count) compressCompletionHandler(resultDatas);
        }];
    }
}

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
                   compressCompletionHandler:(void (^)(UIImage *resultImage))compressCompletionHandler{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIImage *newIMG = [TXImageCompressor compressToImageWithImage:image
                                                            imageSize:imageSize
                                                             fileSize:fileSize];
        compressCompletionHandler(newIMG);
    });
}

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
                     compressCompletionHandler:(void (^)(NSArray<UIImage*> *resultImages))compressCompletionHandler{
    if (!images || images.count<=0) return;
    NSMutableArray *resultImages=[NSMutableArray array];
    for (int index=0; index<images.count; index++) {
        UIImage *image=images[index];
        [self compressToImageAtBackgroundWithImage:image imageSize:imageSize fileSize:fileSize compressCompletionHandler:^(UIImage *resultImage) {
            [resultImages addObject:resultImage];
            if (resultImages.count==images.count) compressCompletionHandler(resultImages);
        }];
    }
}

/**
 *  后台压缩得到 目标大小的原分辨率 Images (使用block的结果，记得按需获取主线程)
 *
 *  @param images 原图集合
 *  @param fileSize 文件大小限制
 *  @param compressCompletionHandler 压缩成功后处理程序
 */
+ (void)compressToImagesAtBackgroundWithImages:(NSArray<UIImage*> *)images
                                      fileSize:(NSInteger)fileSize
                     compressCompletionHandler:(void (^)(NSArray<UIImage*> *resultImages))compressCompletionHandler{
    if (!images || images.count<=0) return;
    NSMutableArray *resultImages=[NSMutableArray array];
    for (int index=0; index<images.count; index++) {
        UIImage *image=images[index];
        [self compressToImageAtBackgroundWithImage:image imageSize:image.size fileSize:fileSize compressCompletionHandler:^(UIImage *resultImage) {
            [resultImages addObject:resultImage];
            if (resultImages.count==images.count) compressCompletionHandler(resultImages);
        }];
    }
}


/**
 只缩不压
 若scale为YES，则原图会根据size进行拉伸-会变形
 若scale为NO，则原图会根据size进行填充-不会变形
 */
+ (UIImage *)resizeImageWithImage:(UIImage *)image
                             size:(CGSize)size
                            scale:(BOOL)scale{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    CGRect rect = CGRectMake(0,
                             0,
                             size.width,
                             size.height);
    if (!scale) {
        CGFloat bili_imageWH = image.size.width/
        image.size.height;
        CGFloat bili_SizeWH  = size.width/size.height;
        if (bili_imageWH > bili_SizeWH) {
            CGFloat bili_SizeH_imageH = size.height/
            image.size.height;
            CGFloat height = image.size.height*
            bili_SizeH_imageH;
            CGFloat width = height * bili_imageWH;
            CGFloat x = -(width - size.width)/2;
            CGFloat y = 0;
            rect = CGRectMake(x,y,width,height);
        }else{
            CGFloat bili_SizeW_imageW = size.width/
            image.size.width;
            CGFloat width = image.size.width *
            bili_SizeW_imageW;
            CGFloat height = width / bili_imageWH;
            CGFloat x = 0;
            CGFloat y = -(height - size.height)/2;
            rect = CGRectMake(x,y,width,height);
        }
    }
    [[UIColor clearColor] set];
    UIRectFill(rect);
    [image drawInRect:rect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/**
 只压不缩
 按NSData大小压缩，返回NSData
 */
+ (NSData *)onlyCompressToDataWithImage:(UIImage *)image
                               fileSize:(NSInteger)fileSize{
    CGFloat compression    = 1.0f;
    CGFloat minCompression = 0.001f;
    NSData *imageData = UIImageJPEGRepresentation(image,compression);
    //每次减少的比例
    float scale = 0.1;
    //循环条件：没到最小压缩比例，且没压缩到目标大小
    while ((compression > minCompression)&&
           (imageData.length>fileSize)){
        compression -= scale;
        imageData = UIImageJPEGRepresentation(image,compression);
        //NSLog(@"%f,%lu",compression,(unsigned long)imageData.length);
    }
    //NSLog(@"只压不缩-返回Data大小：%lu kb",imageData.length/1024);
    return imageData;
}

/**
 只压不缩-返回UIImage
 优点：不影响分辨率，不太影响清晰度
 缺点：存在最小限制，可能压不到目标大小
 */
+ (UIImage *)onlyCompressToImageWithImage:(UIImage *)image
                                 fileSize:(NSInteger)fileSize{
    CGFloat compression    = 0.9f;
    CGFloat minCompression = 0.01f;
    NSData *imageData = UIImageJPEGRepresentation(image,compression);
    //每次减少的比例
    float scale = 0.1;
    //新UIImage的Data
    NSData * newimageData = UIImageJPEGRepresentation(image,1);
    //循环条件：没到最小压缩比例，且没压缩到目标大小
    while ((compression > minCompression)&&
           (newimageData.length>fileSize)){
        imageData = UIImageJPEGRepresentation(image,compression);
        UIImage *compressedImage = [UIImage imageWithData:imageData];
        newimageData= UIImageJPEGRepresentation(compressedImage,1);
        //NSLog(@"%f,%lu",compression,(unsigned long)newimageData.length);
        compression -= scale;
    }
    UIImage *compressedImage = [UIImage imageWithData:newimageData];
    //NSLog(@"只压不缩-返回UIImage大小：%lu kb",((NSData *)UIImageJPEGRepresentation(compressedImage,1)).length/1024);
    return compressedImage;
}

@end
