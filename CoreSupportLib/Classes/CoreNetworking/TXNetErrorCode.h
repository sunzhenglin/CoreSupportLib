//
//  TXNetErrorCode.h
//  SchoolWatchParent
//
//  Created by komlin on 2018/9/4.
//  Copyright © 2018年 Komlin. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 网络请求错误通知 */
FOUNDATION_EXPORT NSString *const TXNetWorkRequestErrorNotification;
/** 网络请求错误代码类型Key */
FOUNDATION_EXPORT NSString *const errorCodeTypeKey;

/** 错误代码类型 */
typedef NS_ENUM(NSInteger,TXErrorCodeType){
    TXErrorCodeTypeIllegalRequest                =3001,//非法请求
    TXErrorCodeTypeSMSVerificationCodeIsInvalid  =3002,//短信验证码无效
    TXErrorCodeTypeUsernameOrPasswordIsIncorrect =3003,//用户名或密码不正确
    TXErrorCodeTypeParameterError                =4001,//参数错误（参数为空或格式不正确)
    TXErrorCodeTypeContactHasReachedTheLimit     =4002,//联系人已达上限(最大10人)
    TXErrorCodeTypeEmergencyContactHasReachedTheLimit =4003,//紧急联系人已达上限(最大5人)
    TXErrorCodeTypeStudentInformationNotFound         =4004,//未找到学生信息
    TXErrorCodeTypeTeacherInformationNotFound         =4005,//未找到教师信息
    TXErrorCodeTypeUnboundMobileNumber                =4006,//未绑定手机号码
    TXErrorCodeTypeNameVerificationFailed             =4007,//姓名校验失败
    TXErrorCodeTypeRepeatBindingStudentInformation    =4008,//重复绑定学生信息
    TXErrorCodeTypeParentUserNotFound                 =4009,//未找到家长用户
    TXErrorCodeTypeAlarmAddedToTheUpperLimit          =4010,//闹钟添加达到上限
    TXErrorCodeTypeCantDeleteYourself                 =4011,//不能删除自己
    TXErrorCodeTypeNoDeletePermission                 =4012,//没有删除权限
    TXErrorCodeTypeNoFenceSet                         =4013,//没有设置栅栏
    TXErrorCodeTypeNotInSchool                        =4014,//不在学校内
    TXErrorCodeTypePunched                            =4015,//已打卡
    TXErrorCodeTypeSameTitle                          =4016,//存在相同称呼
    TXErrorCodeTypeNotWearingAWatch                   =4017,//未佩戴手表
    TXErrorCodeTypeNoDataHeartRate                    =4018,//未获取数据
    TXErrorCodeTypeNoAccess                           =4019,//没有访问权限
    TXErrorCodeTypeWatchIsNotOnLine                   =4020,//手表不在线
    TXErrorCodeTypeInsufficientRedemption             =4021,//兑换数量不足
    TXErrorCodeTypeFileNotFound                       =4022,//未找到文件
    TXErrorCodeTypeNoInspectionItemsFound             =4023,//未找到巡检项目
    TXErrorCodeTypeTimeSelectionError                 =4024,//时间选择错误
    TXErrorCodeTypeLeave                              =4025,//请假中
    TXErrorCodeTypeRepeatAddingFriendNumbers          =4026,//重复添加好友号码
    TXErrorCodeTypeFakeCourseIsNotProcessed           =4027,//假条代课未处理完成
    TXErrorCodeTypeOperationFailed                    =4028,//操作失败
    TXErrorCodeTypeUFaceRegistrationFailed            =4029,//Uface注册失败
    TXErrorCodeTypeUFaceImageUploadFailed             =4030,//Uface图片上传失败
    TXErrorCodeTypeUFaceUserIsNotRegistered           =4031,//Uface用户未注册
    TXErrorCodeTypeUFaceUserIsAlreadyRegistered       =4032,//Uface用户已注册
    TXErrorCodeTypePermissionDenied                   =4033,//没有权限
    TXErrorCodeTypeNoNeedToSignIn                     =4034,//不需要签到
    TXErrorCodeTypeNotAPublicHolidayDontLetASubstitute =4035,//不能找人代课（不是公假不让代课）
    TXErrorCodeTypeServerError                        =5001,//服务器发生错误
    TXErrorCodeTypeDataSaveFailed                     =5002,//数据保存失败
    TXErrorCodeTypeDataDeletionFailed                 =5003,//数据删除失败
    TXErrorCodeTypeFrequentOperation                  =5004,//操作频繁
    TXErrorCodeTypeRongyunPlatformUserRegistrationFailed =6001,//融云平台用户注册失败
    TXErrorCodeTypeRongyunPlatformFailedToUpdateUsers    =6002,//融云平台更新用户失败
    TXErrorCodeTypeGuardianVerificationFailed            =6003,//监护人校验失败
    TXErrorCodeTypeActivationFailedMobileNumberHasBeenSelected =6004,//激活失败,手机号码已被选
    TXErrorCodeTypeActivationFailedWatchHasBeenActivated       =6005,//激活失败,手表已被激活
};

@interface TXNetErrorCode : NSObject

/**
 *  是否包含错误代码
 *  @param errorCodeType 错误代码
 */
+ (BOOL)isContainErrorCodeType:(TXErrorCodeType)errorCodeType;

/** 错误消息 */
+ (NSString*)errorMessageWithErrorCodeType:(TXErrorCodeType)errorCodeType;

/** 推送错误代码 */
+ (void)pushNetWorkRequestErrorWithErrorCodeType:(TXErrorCodeType)errorCodeType;

@end
