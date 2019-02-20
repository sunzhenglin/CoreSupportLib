//
//  UIViewController+TXKit.h
//  TeacherWatch
//
//  Created by komlin on 2019/1/18.
//  Copyright © 2019 Zlin Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (TXKit)
/** 状态栏高度 */
- (CGFloat)statusBarHeight;
/** 获取导航栏+状态栏的高度 */
- (CGFloat)navigationBarHeight;
/** TabBar高度 */
- (CGFloat)tabBarHeight;
@end

NS_ASSUME_NONNULL_END
