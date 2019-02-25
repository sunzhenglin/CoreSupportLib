//
//  UITextView+TXKit.m
//  Furling
//
//  Created by xtz_pioneer on 2018/6/12.
//  Copyright © 2018年 zhangxiong. All rights reserved.
//

#import "UITextView+TXKit.h"
#import <objc/runtime.h>

const char *kTextViewInputLimitKey = "kTextViewInputLimit";
@implementation UITextView (TXKit)

- (void)addObserver {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 添加监听(监听文本的变化)
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidChange:) name:UITextViewTextDidChangeNotification object:nil];
    });
}

#pragma mark - 通知事件
- (void)textViewDidChange:(NSNotification *)notification {
    UITextView *textView = (UITextView *)notification.object;
    if (self.inputLimit > 0 && textView.text.length > self.inputLimit && textView.markedTextRange == nil) {
        textView.text = [textView.text substringToIndex:self.inputLimit - 1];
    }
}

#pragma mark - setter方法
- (void)setInputLimit:(NSInteger)inputLimit {
    [self addObserver];
    objc_setAssociatedObject(self, kTextViewInputLimitKey, @(inputLimit), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - getter方法
- (NSInteger)inputLimit {
    NSNumber *limit = objc_getAssociatedObject(self, kTextViewInputLimitKey);
    return [limit integerValue];
}
@end
