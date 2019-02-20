//
//  UITabBarController+TXKit.h
//  Furling
//
//  Created by xtz_pioneer on 2018/7/6.
//  Copyright © 2018年 zhangxiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (TXKit)

/* 设置TabBarItem
 * @param tabbarItem tabbarItem
 * @param title 标题
 * @param titleSize 标题字体大小
 * @param titleFontName 标题字体名称
 * @param selectedImage 选中图标
 * @param selectedTitleColor 选中字体颜色
 * @param normalImage 未选中图标
 * @param normalTitleColor 未选中字体颜色
 */
- (void)setTabBarItem:(UITabBarItem *)tabbarItem
                title:(NSString *)title
            titleSize:(CGFloat)size
        titleFontName:(NSString *)fontName
        selectedImage:(NSString *)selectedImage
   selectedTitleColor:(UIColor *)selectColor
          normalImage:(NSString *)unselectedImage
     normalTitleColor:(UIColor *)unselectColor;

/*设置TabBar背景颜色*/
- (void)setTabBarBackgroundColor:(UIColor*)backgroundColor;
@end
