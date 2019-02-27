//
//  TXRouter.h
//  TXRouter
//
//  Created by xtz_pioneer on 2018/6/20.
//  Copyright © 2018年 zhangxiong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol KitPassValueDelegate <NSObject>

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


@property (nonatomic,strong)id<KitPassValueDelegate> delegate;

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
@end
