//
//  UIColor+TXKit.h
//  Furling
//
//  Created by xtz_pioneer on 2018/6/12.
//  Copyright © 2018年 zhangxiong. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 * 传入r,g,b,a
 */
#define TXRGBA(r, g, b, a) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a]

/*
 * 传入r,g,b
 */
#define TXRGB(r, g, b) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1.f]

/*
 * 传入一个十六进制颜色字符串，转换为相应的颜色。（不带"#"号
 */
#define TXColorFromRGB(hexString) [UIColor colorWithHexColorString:hexString]

/*
 * 给UIColor类添加许多有用的方法
 */
@interface UIColor (TXKit)
/*
 * 返回当前颜色的r值
 */
- (CGFloat)redValue;

/*
 * 返回当前颜色的g值
 */
- (CGFloat)greenValue;

/*
 * 返回当前颜色的b值
 */
- (CGFloat)blueValue;

/*
 * 打印查看当前颜色的rgba值
 */
- (void)colorDetail;

/*
 * 传入一个十六进制颜色字符串，转换为相应的颜色。（不带"#"号）
 */
+ (UIColor *)colorWithHexColorString:(NSString *)hexString;

/*
 * 烟白色(F5F5F5)
 */
+ (UIColor *)smokeWhiteColor;

/*
 * 黄绿色(9ACD32)
 */
+ (UIColor *)yellowGreenColor;

/*
 * 艾利斯兰(F0F8FF)
 */
+ (UIColor *)aliceBlueColor;

/*
 * 古董白(FAEBD7)
 */
+ (UIColor *)antiqueWhiteColor;

/*
 * 碧绿色(7FFFD4)
 */
+ (UIColor *)aquaMarineColor;

/*
 * 米色(F5F5DC)
 */
+ (UIColor *)beigeColor;

/*
 * 紫罗兰色(8A2BE2)
 */
+ (UIColor *)blueVioletColor;

/*
 * 实木色(DEB887)
 */
+ (UIColor *)burlyWoodColor;

/*
 * 随机创建一种颜色
 */
+ (UIColor *)randomColor;

/**
 *  渐变颜色
 */
+ (UIColor*)gradientFromColor:(UIColor*)fromColor toColor:(UIColor*)toColor withHeight:(CGFloat)height;
@end
