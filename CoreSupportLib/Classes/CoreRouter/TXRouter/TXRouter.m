//
//  TXRouter.h
//  TXRouter
//
//  Created by xtz_pioneer on 2018/6/20.
//  Copyright © 2018年 zhangxiong. All rights reserved.
//

#import "TXRouter.h"
#import "TXCreateObject.h"

NSString * const viewControllerKey=@"viewController";

@implementation TXRouter

/** 路由管理器 */
+ (TXRouter *)router{
    static TXRouter * router = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        router = [[super allocWithZone:nil] init];
    });
    return router;
}

+ (id)allocWithZone:(NSZone *)zone{
    return [TXRouter router];
}

- (id)copyWithZone:(NSZone *)zone{
    return [TXRouter router];
}

- (id)mutableCopyWithZone:(NSZone *)zone{
    return [TXRouter router];
}

/**
 * 创建对象
 * @param className 类名字
 */
+ (id)createObjectWithClassName:(NSString *)className{
    return [TXCreateObject createObjectWithClassName:className];
}

/**
 * 创建对象
 * @param className 类名字
 * @param parameters 传递的参数
 * 注意:必须实现"initWithParameters:(NSDictionary*)parameters"该方法
 */
+ (id)createObjectWithClassName:(NSString *)className parameters:(NSDictionary*)parameters{
    return [TXCreateObject createObjectWithClassName:className parameters:parameters];
}

/**
 * 打开视图控制器
 * @param vCName VC类名字
 * @param parameters 传递的参数
 * @param completionHandler 完成处理
 * 注意:必须实现"initWithParameters:(NSDictionary*)parameters"该方法
 */
+ (void)openVC:(NSString*)vCName parameters:(NSDictionary*)parameters completionHandler:(void (^) (void))completionHandler{
    if (!vCName || [vCName isEqualToString:@""] || !parameters) return;
    if (![[parameters allKeys] containsObject:viewControllerKey]) return;
    NSMutableDictionary * dict=[parameters mutableCopy];
    [dict removeObjectForKey:viewControllerKey];
    id obj=parameters[viewControllerKey];
    if ([obj isKindOfClass:[UINavigationController class]]) {
        UIViewController * toViewController=[TXRouter createObjectWithClassName:vCName parameters:dict];
        if (!toViewController) return;
        toViewController.hidesBottomBarWhenPushed=YES;
        toViewController.view.backgroundColor=[UIColor whiteColor];
        UINavigationController * navigationController=(UINavigationController*)obj;
        [navigationController pushViewController:toViewController animated:YES];
        navigationController.hidesBottomBarWhenPushed=NO;
        if (completionHandler) completionHandler();
    }else if ([obj isKindOfClass:[UIViewController class]]){
        UIViewController * toViewController=[TXRouter createObjectWithClassName:vCName parameters:dict];
        if (!toViewController) return;
        toViewController.view.backgroundColor=[UIColor whiteColor];
        [obj presentViewController:toViewController animated:YES completion:nil];
        if (completionHandler) completionHandler();
    }
}

/**
 * 打开视图控制器
 * @param vCName VC类名字
 * @param parameters 传递的参数
 * 注意:必须实现"initWithParameters:(NSDictionary*)parameters"该方法
 */
+ (void)openVC:(NSString*)vCName parameters:(NSDictionary*)parameters{
    [self openVC:vCName parameters:parameters completionHandler:nil];
}

@end
