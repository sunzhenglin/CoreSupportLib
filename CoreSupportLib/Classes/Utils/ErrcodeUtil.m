//
//  ErrcodeUtil.m
//  TeacherWatch
//
//  Created by Zlin Sun on 2018/8/31.
//  Copyright © 2018年 Zlin Sun. All rights reserved.
//

#import "ErrcodeUtil.h"
@interface ErrcodeUtil()
@property(nonatomic,strong)  NSMutableDictionary *dic;
@end
@implementation ErrcodeUtil
+(id)allocWithZone:(NSZone *)zone{
    return [ErrcodeUtil sharedInstance];
}
+(ErrcodeUtil *) sharedInstance{
    static ErrcodeUtil * s_instance_dj_singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_instance_dj_singleton = [[super allocWithZone:nil] init];
    });
    return s_instance_dj_singleton;
}
-(id)copyWithZone:(NSZone *)zone{
    return [ErrcodeUtil sharedInstance];
}
-(id)mutableCopyWithZone:(NSZone *)zone{
    return [ErrcodeUtil sharedInstance];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ErrCode" ofType:@"plist"];
        //newsTest.plist文件
        self.dic = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    }
    return self;
}
-(NSString *)msg:(int)errcode{
    NSString *key=[NSString stringWithFormat:@"%d",errcode];
     NSString *str= [self.dic objectForKey:key];
    if (!str || [@"" isEqualToString:str]) {
        return key;
    }
    return str;
}


@end
