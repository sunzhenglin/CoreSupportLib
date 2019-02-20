//
//  UIImageView+TXKit.h
//  Furling
//
//  Created by xtz_pioneer on 2018/6/12.
//  Copyright © 2018年 zhangxiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (TXKit)
/** 使用 CAShapeLayer 和 UIBezierPath 设置圆角 */
- (void)tx_setBezierPathCornerRadius:(CGFloat)radius;

/** 通过 Graphics 和 BezierPath 设置圆角（推荐用这个）*/
- (void)tx_setGraphicsCornerRadius:(CGFloat)radius;
@end
