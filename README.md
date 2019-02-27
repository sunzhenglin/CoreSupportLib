
# CoreSupportLib

[![CI Status](https://img.shields.io/travis/acct<blob>=0xE7A9BAE781B5E699BAE883BD/CoreSupportLib.svg?style=flat)](https://travis-ci.org/acct<blob>=0xE7A9BAE781B5E699BAE883BD/CoreSupportLib)
[![1.1](https://img.shields.io/cocoapods/v/CoreSupportLib.svg?style=flat)](https://cocoapods.org/pods/CoreSupportLib)
[![License](https://img.shields.io/cocoapods/l/CoreSupportLib.svg?style=flat)](https://cocoapods.org/pods/CoreSupportLib)
[![iOS 9.0+](https://img.shields.io/cocoapods/p/CoreSupportLib.svg?style=flat)](https://cocoapods.org/pods/CoreSupportLib)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

CoreSupportLib is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CoreSupportLib'
```

## Author

acct<blob>=0xE7A9BAE781B5E699BAE883BD, 393992811@qq.com

## License

CoreSupportLib is available under the MIT license. See the LICENSE file for more info.
## 说明

* [CoreSupportLib/TXRouter](https://github.com/sunzhenglin/CoreSupportLib#CoreSupportLibTXRouter) 

 * [CoreSupportLib/CoreBundle](https://github.com/sunzhenglin/CoreSupportLib#CoreSupportLibCoreBundle) 
 ** [NSBundle+txSubBundle](https://github.com/sunzhenglin/CoreSupportLib#NSBundletxSubBundle)
 ** [UIImage+txSubBundle](https://github.com/sunzhenglin/CoreSupportLib#UIImagetxSubBundle)
 * [CoreSupportLib/CoreCategory](https://github.com/sunzhenglin/CoreSupportLib#CoreSupportLibCoreCategory) 

 推荐使用
 
  ** [NSString+TXKit](https://github.com/sunzhenglin/CoreSupportLib#nsstringtxkit)
  ** [UITextView+TXKit UITextField+TXKit](https://github.com/sunzhenglin/CoreSupportLib#UITextViewTXKit-UITextFieldTXKit)
  ** [UIButton+TXKit](https://github.com/sunzhenglin/CoreSupportLib#UIButtonTXKit)
  ** [UIImageView+TXKit](https://github.com/sunzhenglin/CoreSupportLib#UIImageViewTXKit)
  ** [UIImage+TXKit](https://github.com/sunzhenglin/CoreSupportLib#UIImageTXKit)
  ** [UIView+TXKit](https://github.com/sunzhenglin/CoreSupportLib#UIViewTXKit)
  ** [UIColor+TXKit](https://github.com/sunzhenglin/CoreSupportLib#UIColorTXKit)
  ** [UIViewController+Cloudox](https://github.com/sunzhenglin/CoreSupportLib#UIViewControllerCloudox) 设置导航栏背景透明度
 
 
 其他
 
   ** [UIButton+Layout](https://github.com/sunzhenglin/CoreSupportLib#UIButtonLayout)
   ** [UIImageView+TXKit 1](https://github.com/sunzhenglin/CoreSupportLib#UIImageViewTXKit-1)
   ** [UINavigationController+TXKit](https://github.com/sunzhenglin/CoreSupportLib#UINavigationControllerTXKit)
   ** [UITabBarController+TXKit](https://github.com/sunzhenglin/CoreSupportLib#UITabBarControllerTXKit) 
   ** [UIViewController+TXKit](https://github.com/sunzhenglin/CoreSupportLib#UIViewControllerTXKit)
 * [CoreSupportLib/CoreMacros](https://github.com/sunzhenglin/CoreSupportLib#CoreSupportLibCoreMacros) 
   ** [LogMacros](https://github.com/sunzhenglin/CoreSupportLib#LogMacros) 
   ** [SystemMacros](https://github.com/sunzhenglin/CoreSupportLib#SystemMacros)

### CoreSupportLib/TXRouter

 
```
protocol KitPassValueDelegate <NSObject>

/**
 *  @Description 模块返回传值
 *  @param kitName 模块名字
 *  @param objc 返回值
 */
- (void)passFrom:(NSString *)kitName value:(id)objc;


@end
/*参数*/
FOUNDATION_EXPORT NSString * const viewControllerKey;

/** 路由 */
@interface TXRouter : NSObject


@property (nonatomic,copy)id<KitPassValueDelegate> delegate;

/** 路由管理器 */
+ (TXRouter *)router;

/**
 * 创建对象
 * @param className 类名字
 */
+ (id)createObjectWithClassName:(NSString *)className;

/**
 * 创建对象
 * @param className 类名字
 * @param parameters 传递的参数
 * 注意:必须实现"initWithParameters:(NSDictionary*)parameters"该方法
 */
+ (id)createObjectWithClassName:(NSString *)className parameters:(NSDictionary*)parameters;

/**
 * 打开视图控制器
 * @param vCName VC类名字
 * @param parameters 传递的参数
 * @param completionHandler 完成处理
 * 注意:必须实现"initWithParameters:(NSDictionary*)parameters"该方法
 */
+ (void)openVC:(NSString*)vCName parameters:(NSDictionary*)parameters completionHandler:(void (^) (void))completionHandler;

/**
 * 打开视图控制器
 * @param vCName VC类名字
 * @param parameters 传递的参数
 * 注意:必须实现"initWithParameters:(NSDictionary*)parameters"该方法
 */
+ (void)openVC:(NSString*)vCName parameters:(NSDictionary*)parameters;

- (void)passFrom:(NSString *)kitName value:(id)objc;
```

### CoreSupportLib/CoreBundle

#### NSBundle+txSubBundle 
 ```
 //服务于组件化的xib等资源的获取
 +(instancetype)tx_subBundleWithBundleName:(NSString *)bundleName targetClass:(Class)targetClass;
  ```
####  UIImage+txSubBundle 
 ```
  //服务于组件化的图片等资源的获取
 + (instancetype)tx_imgWithName:(NSString *)name bundle:(NSString *)bundleName targetClass:(Class)targetClass;
 ```

### CoreSupportLib/CoreCategory

推荐

#### NSString+TXKit
 
```
/** 判断是否是有效的(非空/非空白)字符串 */
- (BOOL)tx_isValidString;

/** 判断是否包含指定字符串 */
- (BOOL)tx_containsString:(NSString *)string;

/* 修剪字符串（去掉头尾两边的空格和换行符）*/
- (NSString *)tx_stringByTrim;

/** md5加密（32位小写） */
- (nullable NSString *)tx_md5String;

/** md5加密（16位小写） */
- (nullable NSString *)tx_md5String16;

/**
 *  获取文本的大小
 *
 *  @param  font           文本字体
 *  @param  maxSize        文本区域的最大范围大小
 *  @param  lineBreakMode  字符截断类型
 *
 *  @return 文本大小
 */
- (CGSize)tx_getTextSize:(UIFont *)font maxSize:(CGSize)maxSize mode:(NSLineBreakMode)lineBreakMode;

/**
 *  获取文本的宽度
 *  @param  font    文本字体
 *  @param  height  文本高度
 *  @return 文本宽度
 */
- (CGFloat)tx_getTextWidth:(UIFont *)font height:(CGFloat)height;

/**
 *  获取文本的高度
 *  @param  font   文本字体
 *  @param  width  文本宽度
 *  @return 文本高度
 */
- (CGFloat)tx_getTextHeight:(UIFont *)font width:(CGFloat)width;


///==================================================
///             正则表达式
///==================================================
/** 判断是否是有效的手机号 */
- (BOOL)tx_isValidPhoneNumber;

/** 判断是否是有效的用户密码 */
- (BOOL)tx_isValidPassword;

/** 判断是否是有效的用户名（20位的中文或英文）*/
- (BOOL)tx_isValidUserName;

/** 判断是否是有效的邮箱 */
- (BOOL)tx_isValidEmail;

/** 判断是否是有效的URL */
- (BOOL)isValidUrl;

/** 判断是否是有效的银行卡号 */
- (BOOL)tx_isValidBankNumber;

/** 判断是否是有效的身份证号 */
- (BOOL)tx_isValidIDCardNumber;

/** 判断是否是有效的IP地址 */
- (BOOL)tx_isValidIPAddress;

/** 判断是否是纯汉字 */
- (BOOL)tx_isValidChinese;

/** 判断是否是邮政编码 */
- (BOOL)tx_isValidPostalcode;

/** 判断是否是工商税号 */
- (BOOL)tx_isValidTaxNo;

/** 判断是否是车牌号 */
- (BOOL)tx_isCarNumber;

/** 通过身份证获取性别（1:男, 2:女） */
- (nullable NSNumber *)tx_getGenderFromIDCard;

/** 隐藏证件号指定位数字（如：360723********6341） */
- (nullable NSString *)tx_hideCharacters:(NSUInteger)location length:(NSUInteger)length;
```
 
 

#### UITextView+TXKit UITextField+TXKit
```
/*设置 UITextView 的最大输入长度*/
@property (nonatomic,assign)NSInteger inputLimit;
```
 
#### UIButton+TXKit 
与UIButton+Layout比较推荐用这个

```
/**
 *  设置button的文字和图片的布局样式，及间距
 *
 *  @param style 文字和图片的布局样式
 *  @param space 文字和图片的间距
 */
- (void)tx_layoutButtonWithEdgeInsetsStyle:(TXButtonEdgeInsetsStyle)style
                           imageTitleSpace:(CGFloat)space;
```


#### UIImageView+TXKit  
```
/** 通过 Graphics 和 BezierPath 设置圆角（推荐用这个）*/
- (void)tx_setGraphicsCornerRadius:(CGFloat)radius;
```
####  UIImage+TXKit  
```

/** 显示原图（避免被系统渲染成蓝色） */
+ (nullable UIImage *)tx_originalImage:(NSString *)imageName;
/** 用颜色返回一张图片 */
+ (nullable UIImage *)tx_imageWithColor:(UIColor *)color;
/** 用颜色返回一张图片（指定图片大小） */
+ (nullable UIImage *)tx_imageWithColor:(UIColor *)color size:(CGSize)size;
/** 为UIImage添加滤镜效果 */
- (nullable UIImage *)tx_addFilter:(NSString *)filter;
/** 设置图片的透明度 */
- (nullable UIImage *)tx_alpha:(CGFloat)alpha;
/**
 *  设置圆角图片
 *  @param radius 圆角半径
 */
- (nullable UIImage *)tx_imageByRoundCornerRadius:(CGFloat)radius;
/**
 *  设置圆角图片
 *  @param radius 圆角半径
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 */
- (nullable UIImage *)tx_imageByRoundCornerRadius:(CGFloat)radius
                                      borderWidth:(CGFloat)borderWidth
                                      borderColor:(nullable UIColor *)borderColor;
```
#### UIView+TXKit
```
/** 返回视图的视图控制器(可能为nil) */
@property (nullable, nonatomic, readonly) UIViewController *viewController;

/**
 *  设置视图view的部分圆角(绝对布局)
 *
 *  @param corners  需要设置为圆角的角(枚举类型)
 *  @param radius   需要设置的圆角大小
 */
- (void)tx_setRoundedCorners:(UIRectCorner)corners
                  withRadius:(CGSize)radius;

/**
 *  设置视图view的部分圆角(相对布局)
 *
 *  @param corners  需要设置为圆角的角(枚举类型)
 *  @param radius   需要设置的圆角大小
 *  @param rect     需要设置的圆角view的rect
 */
- (void)tx_setRoundedCorners:(UIRectCorner)corners
                  withRadius:(CGSize)radius
                    viewRect:(CGRect)rect;

/**
 *  设置视图view的阴影
 *
 *  @param color  阴影颜色
 *  @param offset 阴影偏移量
 *  @param radius 阴影半径
 */
- (void)tx_setLayerShadow:(nullable UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;

/** 删除所有子视图 */
- (void)tx_removeAllSubviews;

/** 创建屏幕快照 */
- (nullable UIImage *)tx_snapshotImage;

/** 创建屏幕快照pdf */
- (nullable NSData *)tx_snapshotPDF;

/** 当前视图控制器 */
- (UIViewController*)currentViewController;
```
####  UIColor+TXKit
```
/*
 * 返回当前颜色的r值
 */
- (CGFloat)redValue;

/*
 * 返回当前颜色的g值
 */
- (CGFloat)greenValue;

/*
 * 返回当前颜色的b值
 */
- (CGFloat)blueValue;

/*
 * 打印查看当前颜色的rgba值
 */
- (void)colorDetail;

/*
 * 传入一个十六进制颜色字符串，转换为相应的颜色。（不带"#"号）
 */
+ (UIColor *)colorWithHexColorString:(NSString *)hexString;

/*
 *             烟白色(F5F5F5) 
 *     //黄绿色(9ACD32)  艾利斯兰(F0F8FF)  古董白(FAEBD7) 碧绿色(7FFFD4) 米色(F5F5DC) 紫罗兰色(8A2BE2)实木色(DEB887)
 */
 + (UIColor *)smokeWhiteColor;
 //  yellowGreenColor;aliceBlueColor;antiqueWhiteColor;aquaMarineColor;beigeColor;blueVioletColor;burlyWoodColor;
 
/*
 * 随机创建一种颜色
 */
+ (UIColor *)randomColor;

/**
 *  渐变颜色     关注
 */
+ (UIColor*)gradientFromColor:(UIColor*)fromColor toColor:(UIColor*)toColor withHeight:(CGFloat)height;
```

#### UIViewController+Cloudox
```
 /*设置导航栏背景透明度*/
@property (copy, nonatomic) NSString * navigationAlpha;
```

其他：

#### UINavigationController+Cloudox 
```
UINavigationController+Cloudox
 /*设置导航栏背景透明度*/
- (void)setNeedsNavigationBackground:(CGFloat)alpha;
--------
```

#### UIButton+Layout
```
@property(nonatomic,assign)CGRect titleRect;
@property(nonatomic,assign)CGRect imageRect;
```

####  UIImageView+TXKit 1
```
/** 使用 CAShapeLayer 和 UIBezierPath 设置圆角 */

- (void)tx_setBezierPathCornerRadius:(CGFloat)radius;
```
####  UINavigationController+TXKit
```

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
```
#### UITabBarController+TXKit
```
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
```

#### UIViewController+TXKit
```
/**  获取状态栏高度 */
- (CGFloat)statusBarHeight;
/** 获取导航栏+状态栏的高度 */
- (CGFloat)navigationBarHeight;
/**  获取TabBar高度 */
- (CGFloat)tabBarHeight;
```
 
### CoreSupportLib/CoreMacros

####  LogMacros
```
 /*DEBUG打印日志*/
#if DEBUG
#define TXLog(s, ... ) NSLog( @"<FileName:%@ InThe:%dRow> Log:%@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define TXLog(s, ... )
#endif
```
#### SystemMacros
```
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
#define IPHONEXSMAX_XR (SCREEN_WIDTH == 414.0f && SCREEN_HEIGHT == 896.0f ? YES : NO)```
 
```
