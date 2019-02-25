//
//  UIButton+TXKit.h
//  Furling
//
//  Created by xtz_pioneer on 2018/6/12.
//  Copyright © 2018年 zhangxiong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TXButtonEdgeInsetsStyle) {
    /** image在上，label在下 */
    TXButtonEdgeInsetsStyleTop,
    /** image在左，label在右 */
    TXButtonEdgeInsetsStyleLeft,
    /** image在下，label在上 */
    TXButtonEdgeInsetsStyleBottom,
    /** image在右，label在左 */
    TXButtonEdgeInsetsStyleRight
};

@interface UIButton (TXKit)
/**
 *  设置button的文字和图片的布局样式，及间距
 *
 *  @param style 文字和图片的布局样式
 *  @param space 文字和图片的间距
 */
- (void)tx_layoutButtonWithEdgeInsetsStyle:(TXButtonEdgeInsetsStyle)style
                           imageTitleSpace:(CGFloat)space;
@end
