//
//  BaseHttpService.m
//  WisdomCampus
//
//  Created by 李学亮 on 2017/7/11.
//  Copyright © 2017年 com.komlin.www. All rights reserved.
//
/*
 {
 
 "system": {
 
 "ver": "1.0",
 
 "sign": "0a9f324dc430eace4f4fd1b06738cdaa",
 
 "appId": "abcdefghijklmnopqrstuvwx",
 
 "time": "1404443389",
 
 "nonce": "12345678901234567890123456789012"
 
 },
 
 "params": {
 
 "deviceId": "123456789",
 
 "accessToken": "f88c4dbb354711c9bf6597a4987dce90",
 
 "userId": "ghhc4dbb354711c9bf6597a4987dce90",
 
 "phone": "18899998888"
 
 },
 
 "id": "88"
 
 }
 */
#import "BaseHttpService.h"
#import "AFNetworking.h"
#import <CommonCrypto/CommonDigest.h>
#import "TXImageCompressor.h"
@implementation BackModel
- (instancetype)init{
    
    if (self = [super init]) {
        
        self.code = 0;
        self.data = nil;
        self.msg = @"";
        
    }
    return self;
}

+ (instancetype)backResultWithDictionary:(NSDictionary *)dictionary{
     if (![dictionary isKindOfClass:[NSDictionary class]]) return nil;
     BackModel *result = [[BackModel alloc] init];
    if (![dictionary[@"data"] isEqual:[NSNull null]]) {
        result.data = dictionary[@"data"];
     }
      if (![dictionary[@"msg"] isEqual:[NSNull null]]) {
        result.msg = dictionary[@"msg"];
    }
    if (![dictionary[@"code"] isEqual:[NSNull null]]) {
        result.code = [dictionary[@"code"] intValue];
    }
    return result;
}

 
@end

@implementation BaseHttpService

+ (void)Post:(NSString *)url
       param:(NSDictionary *)param
successBlock:(SuccessBlock)successBlock
 failedBlock:(FailedBlock)failedBlock{
    
  
    NSString *token   =  [TXUserDataManager userDataManager].logInInfo.token;
    
 
    AFHTTPSessionManager *manager =  [AFHTTPSessionManager manager];
    if (token&&![token isEqualToString:@""]) {
      [manager.requestSerializer setValue:token forHTTPHeaderField:@"Token"];
    }
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
    [manager POST:url parameters:param  progress:nil success:^(NSURLSessionDataTask * task, id responseObject) {
        
       DLog(@"%@%@--->response:%@",url,param,responseObject);
        
        BackModel * backModel = [BackModel backResultWithDictionary:responseObject];
        if (backModel.code!=0) {
            [TXNetErrorCode pushNetWorkRequestErrorWithErrorCodeType:backModel.code];
        }
        

        if (successBlock) {
            successBlock(backModel);
        }
        
    } failure:^(NSURLSessionDataTask * task, NSError *error) {
        
         if (failedBlock) {
            DLog(@"%@",error);
            failedBlock(error);
        }
        
    }];
}

+ (void)Get:(NSString *)url
       param:(NSDictionary *)param
successBlock:(SuccessBlock)successBlock
 failedBlock:(FailedBlock)failedBlock{
    
    
    NSString *token   =  [TXUserDataManager userDataManager].logInInfo.token;
    
    
    AFHTTPSessionManager *manager =  [AFHTTPSessionManager manager];
    if (token&&![token isEqualToString:@""]) {
        [manager.requestSerializer setValue:token forHTTPHeaderField:@"Token"];
    }
    manager.requestSerializer.timeoutInterval = 8.0f;
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
    [manager GET:url parameters:param  progress:nil success:^(NSURLSessionDataTask * task, id responseObject) {
        
        DLog(@"%@%@--->response:%@",url,param,responseObject);
        BackModel * backModel = [BackModel backResultWithDictionary:responseObject];
        if (backModel.code!=0) {
            [TXNetErrorCode pushNetWorkRequestErrorWithErrorCodeType:backModel.code];
        }
        if (successBlock) {
            successBlock(backModel);
        }
        
    } failure:^(NSURLSessionDataTask * task, NSError *error) {
        
        if (failedBlock) {
            DLog(@"%@",error);
            if (error.code == -1001) {
                NSLog(@"-----------请求超时---------");
                
            }
            failedBlock(error);
        }
        
    }];
}

+ (void)uploadPicToSerive:(NSMutableArray *)imgArr
            withSeriveURL:(NSString *)str
                    param:(NSDictionary *)param
             successBlock:(SuccessBlock)successBlock
              failedBlock:(FailedBlock)failedBlock{
    
    
    NSString *token   =  [TXUserDataManager userDataManager].logInInfo.token;
    
    
    AFHTTPSessionManager *manager =  [AFHTTPSessionManager manager];
    if (token&&![token isEqualToString:@""]) {
        [manager.requestSerializer setValue:token forHTTPHeaderField:@"Token"];
    }
    [TXNetWorking showHUDWithShowHUDType:NWShowHUDTypeInfo info:@"正在上传..."];
    
    [manager POST:str parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *imageName = [formatter stringFromDate:[NSDate date]];
        
        for (int i = 0; i < imgArr.count; i++ ) {
            UIImage *img =  imgArr[i];
            //上传的参数(上传图片，以文件流的格式)
            /*图片压缩*/
            NSData *imageData=[TXImageCompressor compressToDataWithImage:img imageSize:img.size fileSize:200];
            NSString *fileName = [NSString stringWithFormat:@"%@.jpg",imageName];
            [formData appendPartWithFileData:imageData name:[NSString stringWithFormat:@"image"] fileName:fileName mimeType:@"image/jpeg"];
        }
        [TXNetWorking dismissHUD];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        [TXNetWorking dismissHUD];
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@%@--->response:%@",str,param,responseObject);
        [TXNetWorking dismissHUD];
        
        BackModel * backModel = [BackModel backResultWithDictionary:responseObject];
        if (backModel.code != 0) {
            [TXNetErrorCode pushNetWorkRequestErrorWithErrorCodeType:backModel.code];
        }
        if (successBlock) {
            successBlock(backModel);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [TXNetWorking dismissHUD];
        
        if (failedBlock) {
            
            failedBlock(error);
        }
        
    }];
}

+ (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}


//md5 32位 加密 （小写）
+ (NSString *)md5_32:(NSString *)str{
    
    const char *cStr = [str UTF8String];
     unsigned char result[32];
    
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",result[0],result[1],result[2],result[3],result[4],result[5],result[6],result[7],result[8],result[9],result[10],result[11],result[12],result[13],result[14],result[15],result[16], result[17],result[18], result[19],result[20], result[21],result[22], result[23],result[24], result[25],result[26], result[27],result[28], result[29],result[30], result[31]]lowercaseString];
    
}
+ (NSString*)getTimeStamp {
    
    NSDate *localDate = [NSDate date]; //获取当前时间
    UInt64 recordTime = [localDate timeIntervalSince1970];//时间戳,*1000为取到毫秒
    NSString *timeStamp = [NSString stringWithFormat:@"%llu", recordTime];
    return timeStamp;
}
+ (NSString *)generateNonce
{
    static int kNumber = 32;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    
    srand(time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}

+(NSString *)getClassID{
    return [[NSUserDefaults standardUserDefaults]objectForKey:@"ClassID"];
}
+(void)setClassID:(NSString *)ClassID{
    [[NSUserDefaults standardUserDefaults]setObject:ClassID forKey:@"ClassID"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
