//
//  UIKitMacros.h
//  Furling
//
//  Created by xtz_pioneer on 2018/6/12.
//  Copyright © 2018年 zhangxiong. All rights reserved.
//

#ifndef UIKitMacros_h
#define UIKitMacros_h
#import "SystenMacros.h"
/** PNG图片路径 */
#define PNGPATH(NAME)          [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"png"]
/** JPG图片路径 */
#define JPGPATH(NAME)          [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"jpg"]
/** 图片资源路径 */
#define PATH(NAME,EXT)         [[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]
/** 加载PNG图片 */
#define PNGIMAGE(NAME)         [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
/** 加载JPG图片 */
#define JPGIMAGE(NAME)         [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
/** 加载资源图片 */
#define IMAGE(NAME,EXT)        [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]
/** 加载图片 */
#define IMAGENAME(NAME)       [UIImage imageNamed:NAME]
/** 字体大小(粗体）*/
#define BOLDSYSTEMFONT(FONTSIZE) [UIFont boldSystemFontOfSize:FONTSIZE]
/** 字体大小(常规）*/
#define SYSTEMFONT(FONTSIZE)     [UIFont systemFontOfSize:FONTSIZE]
/** 字体大小*/
#define FONT(NAME,FONTSIZE)      [UIFont fontWithName:(NAME) size:(FONTSIZE)]
/** 获取导航栏+状态栏的高度 */
#define NAVIGATIONBAR_STATUSBAR_HEIGHT self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height
/** TabBar高度 */
#define TABBAR_HEIGHT self.tabBarController.tabBar.frame.size.height
/** 状态栏高度 */
#define TX_STATUSBAR_HEIGHT (IPHONEX_XS || IPHONEXSMAX_XR ? 44.0f : 20.0f)
/** 获取导航栏+状态栏的高度 */
#define TX_NAVIGATIONBAR_STATUSBAR_HEIGHT (IPHONEX_XS || IPHONEXSMAX_XR ? 88.0f : 64.0f)
/** TabBar高度 */
#define TX_TABBAR_HEIGHT (IPHONEX_XS || IPHONEXSMAX_XR ? 83.0f : 49.0f)
/** 顶部安全区域远离高度 */
#define TX_TOP_SAFE_HEIGHT (IPHONEX_XS || IPHONEXSMAX_XR ? 44.0f : 0.0f)
/** 底部安全区域远离高度*/
#define TX_BOTTOM_SAFE_HEIGHT (IPHONEX_XS || IPHONEXSMAX_XR ? 34.0f : 0.0f)
/*iPhoneX、XS、XSMax、XR的状态栏高度差值*/
#define TX_TOP_DIFFERENCE_HEIGHT (IPHONEX_XS || IPHONEXSMAX_XR ? 24.0f : 0.0f)
#endif /* UIKitMacros_h */
