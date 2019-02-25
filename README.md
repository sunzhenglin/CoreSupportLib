
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
  
  
### NSString+TXKit
 
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
 *
 *  @param  font    文本字体
 *  @param  height  文本高度
 *
 *  @return 文本宽度
 */
- (CGFloat)tx_getTextWidth:(UIFont *)font height:(CGFloat)height;

/**
 *  获取文本的高度
 *
 *  @param  font   文本字体
 *  @param  width  文本宽度
 *
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
 ### NSBundle+txSubBundle UIImage+txSubBundle 
 ```
 //服务于组件化的xib等资源的获取
 +(instancetype)tx_subBundleWithBundleName:(NSString *)bundleName targetClass:(Class)targetClass;
 
 ---
  //服务于组件化的图片等资源的获取
 + (instancetype)tx_imgWithName:(NSString *)name bundle:(NSString *)bundleName targetClass:(Class)targetClass;
 ```
 

### UITextView+TXKit
```
/*UITextView 的最大输入长度*/
@property (nonatomic,assign)NSInteger inputLimit;
```

### UITextField+TXKit
```
/*UITextField 的最大输入长度*/
@property (nonatomic,assign)NSInteger inputLimit;
```


### UIButton+Layout
```
@property(nonatomic,assign)CGRect titleRect;
@property(nonatomic,assign)CGRect imageRect;
```
### UIButton+TXKit 与UIButton+Layout比较推荐用这个

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
### UIImageView+TXKit @过期
```
/** 使用 CAShapeLayer 和 UIBezierPath 设置圆角 */
- (void)tx_setBezierPathCornerRadius:(CGFloat)radius;

/** 通过 Graphics 和 BezierPath 设置圆角（推荐用这个）*/
- (void)tx_setGraphicsCornerRadius:(CGFloat)radius;
```
###  UIImage+TXKit  
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
### UIView+TXKit
```
/** 返回视图的视图控制器(可能为nil) */
@property (nullable, nonatomic, readonly) UIViewController *viewController;
/** left: frame.origin.x */
@property (nonatomic) CGFloat left;
/** top: frame.origin.y */
@property (nonatomic) CGFloat top;
/** right: frame.origin.x + frame.size.width */
@property (nonatomic) CGFloat right;
/** bottom: frame.origin.y + frame.size.height */
@property (nonatomic) CGFloat bottom;
/** width: frame.size.width */
@property (nonatomic) CGFloat width;
/** height: frame.size.height */
@property (nonatomic) CGFloat height;
/** centerX: center.x */
@property (nonatomic) CGFloat centerX;
/** centerY: center.y */
@property (nonatomic) CGFloat centerY;
/** origin: frame.origin */
@property (nonatomic) CGPoint origin;
/** size: frame.size */
@property (nonatomic) CGSize  size;

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
###  UIColor+TXKit
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
 * 烟白色(F5F5F5)
 */
+ (UIColor *)smokeWhiteColor;

/*
 * 黄绿色(9ACD32)
 */
+ (UIColor *)yellowGreenColor;

/*
 * 艾利斯兰(F0F8FF)
 */
+ (UIColor *)aliceBlueColor;

/*
 * 古董白(FAEBD7)
 */
+ (UIColor *)antiqueWhiteColor;

/*
 * 碧绿色(7FFFD4)
 */
+ (UIColor *)aquaMarineColor;

/*
 * 米色(F5F5DC)
 */
+ (UIColor *)beigeColor;

/*
 * 紫罗兰色(8A2BE2)
 */
+ (UIColor *)blueVioletColor;

/*
 * 实木色(DEB887)
 */
+ (UIColor *)burlyWoodColor;

/*
 * 随机创建一种颜色
 */
+ (UIColor *)randomColor;

/**
 *  渐变颜色     关注
 */
+ (UIColor*)gradientFromColor:(UIColor*)fromColor toColor:(UIColor*)toColor withHeight:(CGFloat)height;
```
### UINavigationController+Cloudox UIViewController+Cloudox
```
UINavigationController+Cloudox
 /*设置导航栏背景透明度*/
- (void)setNeedsNavigationBackground:(CGFloat)alpha;
--------
UIViewController+Cloudox
 /*设置导航栏背景透明度*/
@property (copy, nonatomic) NSString * navigationAlpha;
```
###  UINavigationController+TXKit
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
### UITabBarController+TXKit
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
### UIViewController+TXKit
```
/**  获取状态栏高度 */
- (CGFloat)statusBarHeight;
/** 获取导航栏+状态栏的高度 */
- (CGFloat)navigationBarHeight;
/**  获取TabBar高度 */
- (CGFloat)tabBarHeight;
```
###  TXUserDataManager
```

/**
 *  功能:用户信息管理器
 *  
 */

#import <Foundation/Foundation.h>
#import "TXLogInInfo.h"
#import "TXUserInfo.h"
#import "TXRongIMUserInfo.h"

/** 移除用户数据类型 */
typedef NS_ENUM(NSInteger,TXRemoveUserDataType){
    /** 用户信息 */
    TXRemoveUserDataTypeUserInfo       =0,
    /** 登录信息 */
    TXRemoveUserDataTypeLogInInfo      =1,
    /** 融云用户信息 */
    TXRemoveUserDataTypeRongIMUserInfo =2,
};

/** 设置用户数据类型 */
typedef NS_ENUM(NSInteger,TXSetUserDataType){
    /** 用户信息 */
    TXSetUserDataTypeUserInfo       =0,
    /** 登录信息 */
    TXSetUserDataTypeLogInInfo      =1,
    /** 融云用户信息 */
    TXSetUserDataTypeRongIMUserInfo =2,
};

/** 用户数据管理器 */
@interface TXUserDataManager : NSObject
/** 用户数据管理器 */
+ (TXUserDataManager*)userDataManager;
/** 登录信息 */
@property(nonatomic,strong)TXLogInInfo *logInInfo;
/** 用户信息 */
@property(nonatomic,strong)TXUserInfo *userInfo;
/** 融云用户信息 */
@property(nonatomic,strong)TXRongIMUserInfo *rongIMUserInfo;

/**
 *  设置用户数据
 *  @param setUserDataType 设置用户数据类型 (必填)
 *  @param parameters 参数 (必填)
 */
- (void)setUserDataWithSetUserDataType:(TXSetUserDataType)setUserDataType parameters:(NSDictionary*)parameters;

/**
 *  移除用户数据
 *  @param removeUserDataType 移除用户数据类型 (必填)
 */
- (void)removeUserData:(TXRemoveUserDataType)removeUserDataType;

/** 移除用户所有数据 */
- (void)removeUserAllData;

@end
```
### TXUserDataDelegate
```
 TXUserDataChangeDelegate:
/*登录信息发生改变*/
- (void)userDataDelegate:(TXUserDataDelegate*)userDataDelegate logInInfoDidChange:(TXLogInInfo*)logInInfo info:(NSDictionary*)info;
/*用户信息发生改变*/
- (void)userDataDelegate:(TXUserDataDelegate*)userDataDelegate userInfoDidChange:(TXUserInfo*)userInfo info:(NSDictionary*)info;
/*融云用户信息发生改变*/
- (void)userDataDelegate:(TXUserDataDelegate*)userDataDelegate rongIMUserInfoDidChange:(TXRongIMUserInfo*)rongIMUserInfo info:(NSDictionary*)info;

@interface TXUserDataDelegate : NSObject
/*代理属性*/
@property (nonatomic,weak)id <TXUserDataChangeDelegate> delegate;
@end
```
### 宏定义
```
#import "LogMacros.h"
#import "SystenMacros.h"
#import "UIKitMacros.h"
#import "OtherMacros.h"
```

### TXRouter
```

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
```
### TXTimer
```
/** 定时发送 */
typedef void (^TXTimerFired) (void);

/** 定时器 */
@interface TXTimer : NSObject
/** 定时发送代码块 */
@property (nonatomic,copy)TXTimerFired timerFired;
/** 定时发送时间 */
@property (nonatomic,assign)NSTimeInterval timeInterval;

/** 对象方法(构造初始化)
 *  @param timeInterval 时间
 */
- (instancetype)initWithTimeInterval:(NSTimeInterval)timeInterval;

/** 类方法(构造初始化)
 *  @param timeInterval 时间
 */
+ (instancetype)timerWithTimeInterval:(NSTimeInterval)timeInterval;

/** 开始倒计时 */
-(void)start;

/** 停止倒计时 */
- (void)stop;

```
### TXCleanCache
```
/*清理缓存*/
+ (void)cleanCache:(TXCleanCacheCompletionHandler)completionHandler;
/*计算整个缓存目录大小*/
+ (float)folderSizeAtPath;
```
### ui
```

#import "WSDatePickerView.h" 时间选择器
#import "TXPassWordView.h" 密码输入框
#import "TXUseRuleView.h" 使用说明,用户守则
#import "TXLBXScan.h" 二维码扫描
#import "CWCarouselHeader.h" 轮播图
#import "YBPopupMenu.h" 仿微信弹出框
```
