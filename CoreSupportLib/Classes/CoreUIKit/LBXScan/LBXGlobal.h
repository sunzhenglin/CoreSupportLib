//
//  LBXGlobal.h
//  SchoolWatchParent
//
//  Created by komlin on 2018/7/23.
//  Copyright © 2018年 Komlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBXScanViewController.h"

@interface LBXGlobal : NSObject
/*当前选择的扫码库*/
@property (nonatomic, assign) SCANLIBRARYTYPE libraryType;
/*当前选择的识别码制*/
@property (nonatomic, assign) SCANCODETYPE scanCodeType;
+ (instancetype)sharedManager;
/*返回native选择的识别码的类型*/
- (NSString*)nativeCodeType;
- (NSString*)nativeCodeWithType:(SCANCODETYPE)type;
/*返回SCANCODETYPE 类别数组*/
- (NSArray*)nativeTypes;
@end
