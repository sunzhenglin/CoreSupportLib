//
//  SZLLocationManager.h
//  TeacherWatch
//
//  Created by Zlin Sun on 2018/9/20.
//  Copyright © 2018年 Zlin Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^SZLLocationSuccess) (double lat, double lng);
typedef void(^SZLLocationFailed) (NSError *error);

@interface SZLLocationManager : NSObject<CLLocationManagerDelegate>
{
    CLLocationManager *manager;
    SZLLocationSuccess successCallBack;
    SZLLocationFailed failedCallBack;
}

+ (SZLLocationManager *) sharedGpsManager;

+ (void) getSZLLocationWithSuccess:(SZLLocationSuccess)success Failure:(SZLLocationFailed)failure;

+ (void) stop;


@end
 
