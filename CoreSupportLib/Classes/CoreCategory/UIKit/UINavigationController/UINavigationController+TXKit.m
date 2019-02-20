//
//  UINavigationController+TXKit.m
//  Furling
//
//  Created by xtz_pioneer on 2018/7/6.
//  Copyright © 2018年 zhangxiong. All rights reserved.
//

#import "UINavigationController+TXKit.h"

@implementation UINavigationController (TXKit)

- (void)setTitleSize:(CGFloat)size
       titleFontName:(NSString *)fontName
          titleColor:(UIColor*)titleColor
     backgroundColor:(UIColor*)backgroundColor
            barStyle:(UIBarStyle)barStyle{
    self.navigationBar.barStyle = barStyle;
    //标题大小以及颜色
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:fontName size:size],NSForegroundColorAttributeName:titleColor}];
    //背景颜色
    [self.navigationBar setBarTintColor:backgroundColor];
}
@end
