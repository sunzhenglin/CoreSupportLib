//
//  UINavigationController+TXKit.h
//  Furling
//
//  Created by xtz_pioneer on 2018/7/6.
//  Copyright © 2018年 zhangxiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (TXKit)

/* 设置标题字体大小等
 * @param titleSize 标题字体大小
 * @param titleFontName 标题字体名称
 * @param titleColor 标题颜色
 * @param backgroundColor 背景颜色
 * @param barStyle 状态栏类型
 * 注意: 设置barStyle时要在Info.plist中添加"View controller-based status bar appearance"为YES。
 */
- (void)setTitleSize:(CGFloat)size
       titleFontName:(NSString *)fontName
          titleColor:(UIColor*)titleColor
     backgroundColor:(UIColor*)backgroundColor
            barStyle:(UIBarStyle)barStyle;
@end
