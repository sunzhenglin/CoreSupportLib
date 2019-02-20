//
//  TXNetErrorCode.m
//  SchoolWatchParent
//
//  Created by komlin on 2018/9/4.
//  Copyright © 2018年 Komlin. All rights reserved.
//

#import "TXNetErrorCode.h"

NSString * const TXNetWorkRequestErrorNotification =@"netWorkRequestErrorNotification";
NSString * const errorCodeTypeKey=@"errorCodeType";

@implementation TXNetErrorCode

/**
 *  是否包含错误代码
 *  @param errorCodeType 错误代码
 */
+ (BOOL)isContainErrorCodeType:(TXErrorCodeType)errorCodeType{
    TXErrorCodeType aErrorCodeType =(TXErrorCodeTypeIllegalRequest|
                                     TXErrorCodeTypeSMSVerificationCodeIsInvalid|
                                     TXErrorCodeTypeUsernameOrPasswordIsIncorrect|
                                     TXErrorCodeTypeParameterError|
                                     TXErrorCodeTypeContactHasReachedTheLimit|
                                     TXErrorCodeTypeEmergencyContactHasReachedTheLimit|
                                     TXErrorCodeTypeStudentInformationNotFound|
                                     TXErrorCodeTypeTeacherInformationNotFound|
                                     TXErrorCodeTypeUnboundMobileNumber|
                                     TXErrorCodeTypeNameVerificationFailed|
                                     TXErrorCodeTypeRepeatBindingStudentInformation|
                                     TXErrorCodeTypeParentUserNotFound|
                                     TXErrorCodeTypeAlarmAddedToTheUpperLimit|
                                     TXErrorCodeTypeCantDeleteYourself|
                                     TXErrorCodeTypeNoDeletePermission|
                                     TXErrorCodeTypeNoFenceSet|
                                     TXErrorCodeTypeNotInSchool|
                                     TXErrorCodeTypePunched|
                                     TXErrorCodeTypeSameTitle|
                                     TXErrorCodeTypeNotWearingAWatch|
                                     TXErrorCodeTypeNoDataHeartRate|
                                     TXErrorCodeTypeNoAccess|
                                     TXErrorCodeTypeWatchIsNotOnLine|
                                     TXErrorCodeTypeInsufficientRedemption|
                                     TXErrorCodeTypeFileNotFound|
                                     TXErrorCodeTypeNoInspectionItemsFound|
                                     TXErrorCodeTypeTimeSelectionError|
                                     TXErrorCodeTypeLeave|
                                     TXErrorCodeTypeRepeatAddingFriendNumbers|
                                     TXErrorCodeTypeFakeCourseIsNotProcessed|
                                     TXErrorCodeTypeOperationFailed|
                                     TXErrorCodeTypeUFaceRegistrationFailed|
                                     TXErrorCodeTypeUFaceImageUploadFailed|
                                     TXErrorCodeTypeUFaceUserIsNotRegistered|
                                     TXErrorCodeTypeUFaceUserIsAlreadyRegistered|
                                     TXErrorCodeTypePermissionDenied|
                                     TXErrorCodeTypeNoNeedToSignIn|
                                     TXErrorCodeTypeNotAPublicHolidayDontLetASubstitute|
                                     TXErrorCodeTypeServerError|
                                     TXErrorCodeTypeDataSaveFailed|
                                     TXErrorCodeTypeDataDeletionFailed|
                                     TXErrorCodeTypeFrequentOperation|
                                     TXErrorCodeTypeRongyunPlatformUserRegistrationFailed|
                                     TXErrorCodeTypeRongyunPlatformFailedToUpdateUsers|
                                     TXErrorCodeTypeGuardianVerificationFailed|
                                     TXErrorCodeTypeActivationFailedMobileNumberHasBeenSelected|
                                     TXErrorCodeTypeActivationFailedWatchHasBeenActivated);
    if ((errorCodeType & aErrorCodeType)){
        return YES;
    }else{
        return NO;
    }
}

/** 错误消息 */
+ (NSString*)errorMessageWithErrorCodeType:(TXErrorCodeType)errorCodeType{
    if (errorCodeType==TXErrorCodeTypeIllegalRequest) {
        return @"非法请求";
    }else if (errorCodeType==TXErrorCodeTypeSMSVerificationCodeIsInvalid){
        return @"短信验证码无效";
    }else if (errorCodeType==TXErrorCodeTypeUsernameOrPasswordIsIncorrect){
        return @"用户名或密码不正确";
    }else if (errorCodeType==TXErrorCodeTypeParameterError){
        return @"参数错误（参数为空或格式不正确)";
    }else if (errorCodeType==TXErrorCodeTypeContactHasReachedTheLimit){
        return @"联系人已达上限(最大10人)";
    }else if (errorCodeType==TXErrorCodeTypeEmergencyContactHasReachedTheLimit){
        return @"紧急联系人已达上限(最大5人)";
    }else if (errorCodeType==TXErrorCodeTypeStudentInformationNotFound){
        return @"未找到学生信息";
    }else if (errorCodeType==TXErrorCodeTypeTeacherInformationNotFound){
        return @"未找到教师信息";
    }else if (errorCodeType==TXErrorCodeTypeUnboundMobileNumber){
        return @"未绑定手机号码";
    }else if (errorCodeType==TXErrorCodeTypeNameVerificationFailed){
        return @"姓名校验失败";
    }else if (errorCodeType==TXErrorCodeTypeRepeatBindingStudentInformation){
        return @"重复绑定学生信息";
    }else if (errorCodeType==TXErrorCodeTypeParentUserNotFound){
        return @"未找到家长用户";
    }else if (errorCodeType==TXErrorCodeTypeAlarmAddedToTheUpperLimit){
        return @"闹钟添加达到上限";
    }else if (errorCodeType==TXErrorCodeTypeCantDeleteYourself){
        return @"不能删除自己";
    }else if (errorCodeType==TXErrorCodeTypeNoDeletePermission){
        return @"没有删除权限";
    }else if (errorCodeType==TXErrorCodeTypeNoFenceSet){
        return @"没有设置栅栏";
    }else if (errorCodeType==TXErrorCodeTypeNotInSchool){
        return @"不在学校内";
    }else if (errorCodeType==TXErrorCodeTypePunched){
        return @"已打卡";
    }else if (errorCodeType==TXErrorCodeTypeSameTitle){
        return @"存在相同称呼";
    }else if (errorCodeType==TXErrorCodeTypeNotWearingAWatch){
        return @"未佩戴手表";
    }else if (errorCodeType==TXErrorCodeTypeNoDataHeartRate){
        return @"未获取数据";
    }else if (errorCodeType==TXErrorCodeTypeNoAccess){
        return @"没有访问权限";
    }else if (errorCodeType==TXErrorCodeTypeWatchIsNotOnLine){
        return @"手表不在线";
    }else if (errorCodeType==TXErrorCodeTypeInsufficientRedemption){
        return @"兑换数量不足";
    }else if (errorCodeType==TXErrorCodeTypeFileNotFound){
        return @"未找到文件";
    }else if (errorCodeType==TXErrorCodeTypeNoInspectionItemsFound){
        return @"未找到巡检项目";
    }else if (errorCodeType==TXErrorCodeTypeTimeSelectionError){
        return @"时间选择错误";
    }else if (errorCodeType==TXErrorCodeTypeLeave){
        return @"请假中";
    }else if (errorCodeType==TXErrorCodeTypeRepeatAddingFriendNumbers){
        return @"重复添加好友号码";
    }else if (errorCodeType==TXErrorCodeTypeFakeCourseIsNotProcessed){
        return @"假条代课未处理完成";
    }else if (errorCodeType==TXErrorCodeTypeOperationFailed){
        return @"操作失败";
    }else if (errorCodeType==TXErrorCodeTypeUFaceRegistrationFailed){
        return @"Face注册失败";
    }else if (errorCodeType==TXErrorCodeTypeUFaceImageUploadFailed){
        return @"Face图片上传失败";
    }else if (errorCodeType==TXErrorCodeTypeUFaceUserIsNotRegistered){
        return @"Face用户未注册";
    }else if (errorCodeType==TXErrorCodeTypePermissionDenied){
        return @"没有权限";
    }else if (errorCodeType==TXErrorCodeTypeNoNeedToSignIn){
        return @"不需要签到";
    }else if (errorCodeType==TXErrorCodeTypeNotAPublicHolidayDontLetASubstitute){
        return @"不是公假不让代课";
    }else if (errorCodeType==TXErrorCodeTypeUFaceUserIsAlreadyRegistered){
        return @"Face用户已注册";
    }else if (errorCodeType==TXErrorCodeTypeServerError){
        return @"服务器发生错误";
    }else if (errorCodeType==TXErrorCodeTypeDataSaveFailed){
        return @"数据保存失败";
    }else if (errorCodeType==TXErrorCodeTypeDataDeletionFailed){
        return @"数据删除失败";
    }else if (errorCodeType==TXErrorCodeTypeFrequentOperation){
        return @"操作频繁";
    }else if (errorCodeType==TXErrorCodeTypeRongyunPlatformUserRegistrationFailed){
        return @"融云平台用户注册失败";
    }else if (errorCodeType==TXErrorCodeTypeRongyunPlatformFailedToUpdateUsers){
        return @"融云平台更新用户失败";
    }else if (errorCodeType==TXErrorCodeTypeGuardianVerificationFailed){
        return @"监护人校验失败";
    }else if (errorCodeType==TXErrorCodeTypeActivationFailedMobileNumberHasBeenSelected){
        return @"激活失败,手机号码已被选";
    }else if (errorCodeType==TXErrorCodeTypeActivationFailedWatchHasBeenActivated){
        return @"激活失败,手表已被激活";
    }else{
         return @"未知错误";
    }
}

/** 推送错误代码 */
+ (void)pushNetWorkRequestErrorWithErrorCodeType:(TXErrorCodeType)errorCodeType{
    NSDictionary *parameters=@{errorCodeTypeKey:[NSNumber numberWithInteger:errorCodeType]};
    [[NSNotificationCenter defaultCenter] postNotificationName:TXNetWorkRequestErrorNotification object:nil userInfo:parameters];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:TXNetWorkRequestErrorNotification object:nil];
}

@end
