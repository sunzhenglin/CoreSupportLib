//
//  UIImage+TXKit.h
//  Furling
//
//  Created by xtz_pioneer on 2018/6/12.
//  Copyright © 2018年 zhangxiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TXKit)
/** 显示原图（避免被系统渲染成蓝色） */
+ (nullable UIImage *)tx_originalImage:(NSString *)imageName;
/** 用颜色返回一张图片 */
+ (nullable UIImage *)tx_imageWithColor:(UIColor *)color;
/** 用颜色返回一张图片（指定图片大小） */
+ (nullable UIImage *)tx_imageWithColor:(UIColor *)color size:(CGSize)size;
/** 为UIImage添加滤镜效果 */
- (nullable UIImage *)tx_addFilter:(NSString *)filter;
/** 设置图片的透明度 */
- (nullable UIImage *)tx_alpha:(CGFloat)alpha;
/**
 *  设置圆角图片
 *  @param radius 圆角半径
 */
- (nullable UIImage *)tx_imageByRoundCornerRadius:(CGFloat)radius;
/**
 *  设置圆角图片
 *  @param radius 圆角半径
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 */
- (nullable UIImage *)tx_imageByRoundCornerRadius:(CGFloat)radius
                                      borderWidth:(CGFloat)borderWidth
                                      borderColor:(nullable UIColor *)borderColor;
@end
