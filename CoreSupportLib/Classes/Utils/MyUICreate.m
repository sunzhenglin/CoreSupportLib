//
// MyUICreate.m
//   
//
//  Created by sunzl on 18/7/25.
//  Copyright © 2016年 Isaac. All rights reserved.
//

#import "MyUICreate.h"

@implementation MyUICreate
#pragma mark -- 创建button
+ (UIButton *)createButtonWithFrame:(CGRect) frame
                              title:(NSString *)title
                         titleColor:(UIColor *)color
                               font:(UIFont *)font
                          backColor:(UIColor *)backColor
                       cornerRadius:(CGFloat)cornerRadius
                          superView:(UIView *)superView
                            {
    
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    myButton.frame = frame;
    [myButton setTitle:title forState:UIControlStateNormal];
    [myButton setTitleColor:color forState:UIControlStateNormal];
    myButton.titleLabel.font=font;
            
    myButton.backgroundColor = backColor;
    if (cornerRadius > 0) {
        myButton.layer.cornerRadius = cornerRadius;
        myButton.clipsToBounds = YES;
    }
    if (superView) {
        [superView addSubview:myButton];
    }
    
   return myButton;
    
}

#pragma 快捷创建UILabel
+ (UILabel *)createLabelWithFrame:(CGRect)frame
                             text:(NSString* )text
                        textColor:(UIColor *)textColor
                             Font:(UIFont *)font
                        backColor:(UIColor *)backColor
                     cornerRadius:(CGFloat)cornerRadius
                        superView:(UIView *)superView{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    if (backColor != nil) {
        label.backgroundColor = backColor;
    }
     if (cornerRadius > 0) {
        label.layer.cornerRadius = cornerRadius;
        label.clipsToBounds = YES;
    }
    [superView addSubview:label];
    return label;
    
    
    
}




#pragma mark -- 创建textF
+ (UITextField *)createTextFieldWithFrame:(CGRect) frame
                                    title:(NSString *)title
                                textColor:(UIColor *)color
                                     font:(UIFont *)font
                                backColor:(UIColor *)backColor

                             cornerRadius:(CGFloat)cornerRadius
                                superView:(UIView *)superView{
    UITextField *textF = [[UITextField alloc]initWithFrame:frame];
  

    if (font != nil) {
        textF.font = font;
    }
 
    if (color != nil) {
       textF.textColor = color;
    }
    if (backColor != nil) {
        textF.backgroundColor = backColor;
    }
 
    if (cornerRadius > 0) {
        textF.layer.cornerRadius = cornerRadius;
        textF.clipsToBounds = YES;
    }
        [superView addSubview:textF];
    return textF;
}


#pragma mark -- 创建ImageView
+ (UIImageView *)createImageViewWithFrame:(CGRect) frame
                                backColor:(UIColor *)backColor
                             cornerRadius:(CGFloat)cornerRadius
                                superView:(UIView *)superView{
    UIImageView *imagV = [[UIImageView alloc]initWithFrame:frame];
    if (backColor != nil) {
        imagV.backgroundColor = backColor;
    }
    if (cornerRadius > 0) {
        imagV.layer.cornerRadius = cornerRadius;
        imagV.clipsToBounds = YES;
    }
    [superView addSubview:imagV];
     return imagV;
}


@end
