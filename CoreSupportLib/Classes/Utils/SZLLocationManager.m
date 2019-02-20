//
//  SZLLocationManager.m
//  TeacherWatch
//
//  Created by Zlin Sun on 2018/9/20.
//  Copyright © 2018年 Zlin Sun. All rights reserved.
//

#import "SZLLocationManager.h"
#import <UIKit/UIKit.h>
@implementation SZLLocationManager

+ (SZLLocationManager *) sharedGpsManager {
    static SZLLocationManager *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[SZLLocationManager alloc] init];
    });
    return shared;
}

- (id)init {
    self = [super init];
    if (self) {
        // 打开定位 然后得到数据
        manager = [[CLLocationManager alloc] init];
        manager.delegate = self;
        //控制定位精度,越高耗电量越
        manager.desiredAccuracy = kCLLocationAccuracyBest;
        
        // 兼容iOS8.0版本
        /* Info.plist里面加上2项
         NSLocationAlwaysUsageDescription      Boolean YES
         NSLocationWhenInUseUsageDescription   Boolean YES
         */
        
        // 请求授权 requestWhenInUseAuthorization用在>=iOS8.0上
        // respondsToSelector: 前面manager是否有后面requestWhenInUseAuthorization方法
        // 1. 适配 动态适配
        if ([manager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [manager requestWhenInUseAuthorization];
            [manager requestAlwaysAuthorization];
        }
        // 2. 另外一种适配 systemVersion 有可能是 8.1.1
        float osVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
        if (osVersion >= 8) {
            [manager requestWhenInUseAuthorization];
            [manager requestAlwaysAuthorization];
        }
    }
    return self;
}

- (void)getSZLLocationWithSuccess:(SZLLocationSuccess)success Failure:(SZLLocationFailed)failure {
    successCallBack = [success copy];
    failedCallBack = [failure copy];
    // 停止上一次的
    [manager stopUpdatingLocation];
    // 开始新的数据定位
    [manager startUpdatingLocation];
}


+ (void) getSZLLocationWithSuccess:(SZLLocationSuccess)success Failure:(SZLLocationFailed)failure {
    [[SZLLocationManager sharedGpsManager] getSZLLocationWithSuccess:success Failure:failure];
}


- (void) stop {
    [manager stopUpdatingLocation];
}

+ (void) stop {
    [[SZLLocationManager sharedGpsManager] stop];
}

// 每隔一段时间就会调用
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    for (CLLocation *loc in locations) {
        CLLocationCoordinate2D l = loc.coordinate;
        double lat = l.latitude;
        double lnt = l.longitude;
        
        successCallBack ? successCallBack(lat, lnt) : nil;
    }
}

//失败代理方法
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    failedCallBack ? failedCallBack(error) : nil;
    if ([error code] == kCLErrorDenied) {
        NSLog(@"访问被拒绝");
    }
    if ([error code] == kCLErrorLocationUnknown) {
        NSLog(@"无法获取位置信息");
    }
}

@end
