//
//  NSString+TXKit.h
//  Furling
//
//  Created by xtz_pioneer on 2018/6/12.
//  Copyright © 2018年 zhangxiong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (TXKit)
/** 判断是否是有效的(非空/非空白)字符串 */
- (BOOL)tx_isValidString;

/** 判断是否包含指定字符串 */
- (BOOL)tx_containsString:(NSString *)string;

/* 修剪字符串（去掉头尾两边的空格和换行符）*/
- (NSString *)tx_stringByTrim;

/** md5加密（32位小写） */
- (nullable NSString *)tx_md5String;

/** md5加密（16位小写） */
- (nullable NSString *)tx_md5String16;

/**
 *  获取文本的大小
 *
 *  @param  font           文本字体
 *  @param  maxSize        文本区域的最大范围大小
 *  @param  lineBreakMode  字符截断类型
 *
 *  @return 文本大小
 */
- (CGSize)tx_getTextSize:(UIFont *)font maxSize:(CGSize)maxSize mode:(NSLineBreakMode)lineBreakMode;

/**
 *  获取文本的宽度
 *
 *  @param  font    文本字体
 *  @param  height  文本高度
 *
 *  @return 文本宽度
 */
- (CGFloat)tx_getTextWidth:(UIFont *)font height:(CGFloat)height;

/**
 *  获取文本的高度
 *
 *  @param  font   文本字体
 *  @param  width  文本宽度
 *
 *  @return 文本高度
 */
- (CGFloat)tx_getTextHeight:(UIFont *)font width:(CGFloat)width;


///==================================================
///             正则表达式
///==================================================
/** 判断是否是有效的手机号 */
- (BOOL)tx_isValidPhoneNumber;

/** 判断是否是有效的用户密码 */
- (BOOL)tx_isValidPassword;

/** 判断是否是有效的用户名（20位的中文或英文）*/
- (BOOL)tx_isValidUserName;

/** 判断是否是有效的邮箱 */
- (BOOL)tx_isValidEmail;

/** 判断是否是有效的URL */
- (BOOL)isValidUrl;

/** 判断是否是有效的银行卡号 */
- (BOOL)tx_isValidBankNumber;

/** 判断是否是有效的身份证号 */
- (BOOL)tx_isValidIDCardNumber;

/** 判断是否是有效的IP地址 */
- (BOOL)tx_isValidIPAddress;

/** 判断是否是纯汉字 */
- (BOOL)tx_isValidChinese;

/** 判断是否是邮政编码 */
- (BOOL)tx_isValidPostalcode;

/** 判断是否是工商税号 */
- (BOOL)tx_isValidTaxNo;

/** 判断是否是车牌号 */
- (BOOL)tx_isCarNumber;

/** 通过身份证获取性别（1:男, 2:女） */
- (nullable NSNumber *)tx_getGenderFromIDCard;

/** 隐藏证件号指定位数字（如：360723********6341） */
- (nullable NSString *)tx_hideCharacters:(NSUInteger)location length:(NSUInteger)length;
@end
