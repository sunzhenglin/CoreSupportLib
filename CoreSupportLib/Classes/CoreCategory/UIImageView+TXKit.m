//
//  UIImageView+TXKit.m
//  Furling
//
//  Created by xtz_pioneer on 2018/6/12.
//  Copyright © 2018年 zhangxiong. All rights reserved.
//

#import "UIImageView+TXKit.h"

@implementation UIImageView (TXKit)

#pragma mark - 使用 CAShapeLayer 和 UIBezierPath 设置圆角
- (void)tx_setBezierPathCornerRadius:(CGFloat)radius {
    // 创建BezierPath 并设置角 和 半径 这里只设置了 左上 和 右上
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.frame = self.bounds;
    layer.path = path.CGPath;
    self.layer.mask = layer;
}

#pragma mark - 通过 Graphics 和 BezierPath 设置圆角（推荐用这个）
- (void)tx_setGraphicsCornerRadius:(CGFloat)radius {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius] addClip];
    [self drawRect:self.bounds];
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束
    UIGraphicsEndImageContext();
}
@end
