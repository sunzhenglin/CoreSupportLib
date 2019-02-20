//
//  UITextField+TXKit.m
//  Furling
//
//  Created by xtz_pioneer on 2018/6/12.
//  Copyright © 2018年 zhangxiong. All rights reserved.
//

#import "UITextField+TXKit.h"
#import <objc/runtime.h>

const char *kTextFieldInputLimitKey = "kTextFieldInputLimit";

@implementation UITextField (TXKit)

- (void)addObserver {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 添加监听(监听文本的变化)
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
    });
}

#pragma mark - 通知事件
- (void)textFieldDidChange:(NSNotification *)notification {
    UITextField *textField = (UITextField *)notification.object;
    if (self.inputLimit > 0 && textField.text.length > self.inputLimit && textField.markedTextRange == nil) {
        textField.text = [textField.text substringToIndex:self.inputLimit - 1];
    }
}

#pragma mark - setter方法
- (void)setInputLimit:(NSInteger)inputLimit {
    [self addObserver];
    objc_setAssociatedObject(self, kTextFieldInputLimitKey, @(inputLimit), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - getter方法
- (NSInteger)inputLimit {
    NSNumber *limit = objc_getAssociatedObject(self, kTextFieldInputLimitKey);
    return [limit integerValue];
}

@end
