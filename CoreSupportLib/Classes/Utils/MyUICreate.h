//
// MyUICreate.h
//   
//
//   Created by sunzl on 18/7/25.
//  Copyright © 2016年 Isaac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MyUICreate : NSObject

#pragma mark -- 创建button
+ (UIButton *)createButtonWithFrame:(CGRect) frame
                              title:(NSString *)title
                         titleColor:(UIColor *)color
                               font:(UIFont *)font
                          backColor:(UIColor *)backColor
                       cornerRadius:(CGFloat)cornerRadius
                          superView:(UIView *)superView
                             ;

#pragma 快捷创建UILabel
+ (UILabel *)createLabelWithFrame:(CGRect)frame
                        text:(NSString* )text
                        textColor:(UIColor *)textColor
                             Font:(UIFont *)font
                        backColor:(UIColor *)backColor
                     cornerRadius:(CGFloat)cornerRadius
                        superView:(UIView *)superView
                         ;




#pragma mark -- 创建textF
+ (UITextField *)createTextFieldWithFrame:(CGRect) frame
                                    title:(NSString *)title
                                textColor:(UIColor *)color

                                     font:(UIFont *)font
                                backColor:(UIColor *)backColor
                             cornerRadius:(CGFloat)cornerRadius
                                superView:(UIView *)superView;


#pragma mark -- 创建ImageView
+ (UIImageView *)createImageViewWithFrame:(CGRect) frame
                                backColor:(UIColor *)backColor
                             cornerRadius:(CGFloat)cornerRadius
                                superView:(UIView *)superView;





@end
