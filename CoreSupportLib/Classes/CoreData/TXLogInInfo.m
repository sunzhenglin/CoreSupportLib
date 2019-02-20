//
//  TXLogInInfo.m
//  SchoolWatchParent
//
//  Created by xtz_pioneer on 2018/7/13.
//  Copyright © 2018年 Komlin. All rights reserved.
//

#import "TXLogInInfo.h"

NSString *const tokenKey=@"logInInfo.tokenKey";
NSString *const imTokenKey=@"logInInfo.imToken";
NSString *const permissionsKey=@"logInInfo.permissions";
NSString *const bindKey=@"logInInfo.bind";

@interface TXLogInInfo ()
{
    NSString *_token;//服务器请求token
    NSString *_imToken;//融云通讯Token
    NSArray *_permissions;//权限
    NSInteger _bind;//是否绑定手机 (0:未绑定 1:已绑定)
}
@end

@implementation TXLogInInfo

/*Token*/
- (void)setToken:(NSString*)token{
    _token=token;
    [[NSUserDefaults standardUserDefaults] setObject:_token forKey:tokenKey];
}
- (NSString*)token{
    if (!_token) {
        _token=[[NSUserDefaults standardUserDefaults] valueForKey:tokenKey];
    }
    return _token;
}

/*imToken*/
- (void)setImToken:(NSString*)imToken{
    _imToken=imToken;
    [[NSUserDefaults standardUserDefaults] setObject:_imToken forKey:imTokenKey];
}
- (NSString*)imToken{
    if (!_imToken) {
        _imToken=[[NSUserDefaults standardUserDefaults] valueForKey:imTokenKey];
    }
    return _imToken;
}

/*权限*/
- (void)setPermissions:(NSArray*)permissions{
    _permissions=permissions;
    [[NSUserDefaults standardUserDefaults] setObject:_permissions forKey:permissionsKey];
}
- (NSArray*)permissions{
    if (!_permissions) {
        _permissions=[[NSUserDefaults standardUserDefaults] valueForKey:permissionsKey];
    }
    return _permissions;
}

/*绑定*/
- (void)setBind:(NSInteger)bind{
    _bind=bind;
    [[NSUserDefaults standardUserDefaults] setInteger:_bind forKey:bindKey];
}
- (NSInteger)bind{
    if (!_bind) {
        _bind=[[[NSUserDefaults standardUserDefaults] valueForKey:bindKey] integerValue];
    }
    return _bind;
}

/*登录状态*/
- (TXLogInState)logInState{
    if (!self.token || self.token.length==0 || !self.imToken || self.imToken.length==0 ) {
        return TXLogInStateNotLogin;
    }else{
        return TXLogInStateAlreadyLogin;
    }
}

/*设置数据*/
- (void)setDataWithParameters:(NSDictionary*)parameters{
    if([[parameters allKeys] containsObject:@"imToken"]){
        NSString * imToken=parameters[@"imToken"];
        self.imToken=imToken;
    }
    if([[parameters allKeys] containsObject:@"token"]){
        NSString * token=parameters[@"token"];
        self.token=token;
    }
    if([[parameters allKeys] containsObject:@"permissions"]){
        NSArray * permissions=parameters[@"permissions"];
        self.permissions=permissions;
    }
    if([[parameters allKeys] containsObject:@"bind"]){
        NSInteger bind=[parameters[@"bind"] integerValue];
        self.bind=bind;
    }
}

/*移除全部数据*/
- (void)removeAllData{
    self.imToken=nil;
    self.token=nil;
    self.permissions=nil;
    self.bind=0;
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:imTokenKey];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:tokenKey];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:permissionsKey];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:bindKey];
}

@end
