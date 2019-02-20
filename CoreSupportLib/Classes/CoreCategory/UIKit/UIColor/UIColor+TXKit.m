//
//  UIColor+TXKit.m
//  Furling
//
//  Created by xtz_pioneer on 2018/6/12.
//  Copyright © 2018年 zhangxiong. All rights reserved.
//

#import "UIColor+TXKit.h"

@implementation UIColor (TXKit)
- (CGFloat)redValue
{
    const CGFloat *compont = CGColorGetComponents(self.CGColor);
    return compont[0];
}

- (CGFloat)greenValue
{
    const CGFloat *compont = CGColorGetComponents(self.CGColor);
    return compont[1];
}

- (CGFloat)blueValue
{
    const CGFloat *compont = CGColorGetComponents(self.CGColor);
    return compont[2];
}

- (void)colorDetail
{
    
}

+ (UIColor *)colorWithHexColorString:(NSString *)hexString
{
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red = [self colorComponentFrom:colorString start:0 length:1];
            green = [self colorComponentFrom:colorString start:1 length:1];
            blue = [self colorComponentFrom:colorString start:2 length:1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom:colorString start:0 length:1];
            red = [self colorComponentFrom:colorString start:1 length:1];
            green = [self colorComponentFrom:colorString start:2 length:1];
            blue = [self colorComponentFrom:colorString start:3 length:1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red = [self colorComponentFrom:colorString start:0 length:2];
            green = [self colorComponentFrom:colorString start:2 length:2];
            blue = [self colorComponentFrom:colorString start:4 length:2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom:colorString start:0 length:2];
            red = [self colorComponentFrom:colorString start:2 length:2];
            green = [self colorComponentFrom:colorString start:4 length:2];
            blue = [self colorComponentFrom:colorString start:6 length:2];
            break;
        default:
            return nil;
            break;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (CGFloat)colorComponentFrom:(NSString * _Nonnull)string start:(NSUInteger)start length:(NSUInteger)length {
    NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat:@"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString:fullHex] scanHexInt:&hexComponent];
    
    return hexComponent / 255.0;
}

+ (UIColor *)smokeWhiteColor
{
    return [self colorWithHexColorString:@"F5F5F5"];
}

+ (UIColor *)yellowGreenColor
{
    return [self colorWithHexColorString:@"9ACD32"];
}

+ (UIColor *)aliceBlueColor
{
    return [self colorWithHexColorString:@"F0F8FF"];
}

+ (UIColor *)antiqueWhiteColor
{
    return [self colorWithHexColorString:@"FAEBD7"];
}

+ (UIColor *)aquaMarineColor
{
    return [self colorWithHexColorString:@"7FFFD4"];
}

+ (UIColor *)beigeColor
{
    return [self colorWithHexColorString:@"F5F5DC"];
}

+ (UIColor *)blueVioletColor
{
    return [self colorWithHexColorString:@"8A2BE2"];
}

+ (UIColor *)burlyWoodColor
{
    return [self colorWithHexColorString:@"DEB887"];
}

+ (UIColor * _Nonnull)randomColor {
    int r = arc4random() % 255;
    int g = arc4random() % 255;
    int b = arc4random() % 255;
    
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}

+ (UIColor *)gradientFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor withHeight:(CGFloat)height {
    CGSize size = CGSizeMake(1, height);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    NSArray* colors = [NSArray arrayWithObjects:(id)fromColor.CGColor, (id)toColor.CGColor, nil];
    CGGradientRef gradient = CGGradientCreateWithColors(colorspace, (__bridge CFArrayRef)colors, NULL);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0, size.height), 0);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:image];
}
@end
