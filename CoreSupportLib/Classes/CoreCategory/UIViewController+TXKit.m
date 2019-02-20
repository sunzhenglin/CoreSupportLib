//
//  UIViewController+TXKit.m
//  TeacherWatch
//
//  Created by komlin on 2019/1/18.
//  Copyright © 2019 Zlin Sun. All rights reserved.
//

#import "UIViewController+TXKit.h"

@implementation UIViewController (TXKit)

/** 状态栏高度 */
- (CGFloat)statusBarHeight{
    return [[UIApplication sharedApplication] statusBarFrame].size.height;
}

/** 获取导航栏+状态栏的高度 */
- (CGFloat)navigationBarHeight{
    return self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height;
}

/** TabBar高度 */
- (CGFloat)tabBarHeight{
    return self.tabBarController.tabBar.frame.size.height;
}

@end
