//
//  SystenMacros.h
//  Furling
//
//  Created by xtz_pioneer on 2018/6/12.
//  Copyright © 2018年 zhangxiong. All rights reserved.
//

#ifndef SystenMacros_h
#define SystenMacros_h
/** 当前版本系统版本(float) */
#define CURRENT_SYSTEM_VERSION_FLOAT ([[[UIDevice currentDevice] systemVersion] floatValue])
/** 当前版本系统版本(double) */
#define CURRENT_SYSTEM_VERSION_DOUBLE ([[[UIDevice currentDevice] systemVersion] doubleValue])
/** 当前版本系统版本 */
#define CURRENT_SYSTEM_VERSION ([[UIDevice currentDevice] systemVersion])
/** 当前App版本 */
#define CURRENT_APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
/** 当前App版本(build) */
#define CURRENT_APP_BUILD [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
/** 当前App名称 */
#define CURRENT_APP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
/** 手机序列号 */
#define IDENTIFIER_NUMBER [[UIDevice currentDevice] uniqueIdentifier]
/** 手机别名 */
#define USER_PHONE_NAME [[UIDevice currentDevice] name]
/** 手机别名 */
#define PHONE_MODEL [[UIDevice currentDevice] model]
/** 当前语言 */
#define CURRENT_LANGUAGE ([[NSLocale preferredLanguages] objectAtIndex:0])
/** 当前屏幕宽 */
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
/** 当前屏幕高 */
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
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
/** 是否是iPhone3GS_4_4S */
#define IPHONE3GS_4_4S (SCREEN_WIDTH == 320.0f && SCREEN_HEIGHT == 480.0f ? YES : NO)
/** 是否是iPhone5_5C_5S_5SE */
#define IPHONE5_5C_5S_5SE (SCREEN_WIDTH == 320.0f && SCREEN_HEIGHT == 568.0f ? YES : NO)
/** 是否是iPhone6_6S_7_8 */
#define IPHONE6_6S_7_8 (SCREEN_WIDTH== 375.0f && SCREEN_HEIGHT == 667.0f ? YES : NO)
/** 是否是iPhone6Plus_6SPlus_7Plus_8Plus */
#define IPHONE6PLUS_6SPLUS_7PLUS_8PLUS (SCREEN_WIDTH == 414.0f && SCREEN_HEIGHT == 736.0f ? YES: NO)
/** 是否是iPhoneX_XS */
#define IPHONEX_XS (SCREEN_WIDTH == 375.0f && SCREEN_HEIGHT == 812.0f ? YES : NO)
/** 是否是iPhoneXSMax_XR */
#define IPHONEXSMAX_XR (SCREEN_WIDTH == 414.0f && SCREEN_HEIGHT == 896.0f ? YES : NO)
#endif /* SystenMacros_h */
