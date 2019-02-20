//
//  UINavigationController+Cloudox.h
//  SmoothNavDemo
//
//  Created by zhangxiong on 2017/5/19.
//  Copyright © 2017年 zhangxiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Cloudox) <UINavigationBarDelegate, UINavigationControllerDelegate>
@property (copy, nonatomic) NSString * cloudox;
- (void)setNeedsNavigationBackground:(CGFloat)alpha;
@end
