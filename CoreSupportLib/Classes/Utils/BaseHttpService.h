//
//  BaseHttpService.h
//  WisdomCampus
//
//  Created by 李学亮 on 2017/7/11.
//  Copyright © 2017年 com.komlin.www. All rights reserved.
//
/*
{
"id":"123456"
"result": {
    "data": null;
    "code":"0",
    "msg":"操作成功"
}
}*/
#import <Foundation/Foundation.h>
 
@interface BackModel: NSObject
@property (nonatomic) int code;
@property (nonatomic,strong) id data;
@property (nonatomic,copy) NSString * msg;
+ (instancetype)backResultWithDictionary:(NSDictionary *)dictionary;
@end

 

typedef void(^SuccessBlock)(BackModel *backModel);

typedef void(^FailedBlock)(NSError *error);

@interface BaseHttpService : NSObject
 
+ (void)Post:(NSString *)url
       param:(NSDictionary *)param
successBlock:(SuccessBlock)successBlock
 failedBlock:(FailedBlock)failedBlock;
+ (void)Get:(NSString *)url
       param:(NSDictionary *)param
successBlock:(SuccessBlock)successBlock
 failedBlock:(FailedBlock)failedBlock;
//图片
+ (void)uploadPicToSerive:(NSMutableArray *)imgArr
            withSeriveURL:(NSString *)str
                    param:(NSDictionary *)param
             successBlock:(SuccessBlock)successBlock
              failedBlock:(FailedBlock)failedBlock;
+(NSString *)getClassID;
+(void)setClassID:(NSString *)ClassID;

@end
