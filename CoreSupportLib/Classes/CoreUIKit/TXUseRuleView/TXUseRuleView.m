//
//  TXUseRuleView.m
//  TXUseRuleView
//
//  Created by xtz_pioneer on 2018/7/9.
//  Copyright © 2018年 Komlin. All rights reserved.

#import "TXUseRuleView.h"

@interface TXUseRuleView ()<UITextViewDelegate>
{
    //描述
    NSString     * _describe;
    //描述字体
    UIFont       * _describeFont;
    //描述颜色
    UIColor      * _describeColor;
    //使用规则颜色
    UIColor      * _useRuleColor;
    //完成处理程序
    URCompletionHandler _completionHandler;
    //使用规则名称
    NSString     * _useRuleName;
    //字体布局
    NSTextAlignment  _tx_TextAlignment;
}
@end

@implementation TXUseRuleView

- (instancetype)init{
    if (self = [super init]) {
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;
}

/*配置*/
- (void)commonInit{
    self.editable = NO;
    self.scrollEnabled = NO;
    self.delegate=self;
    _describe=@"";
    _useRuleColor=[UIColor blueColor];
    _describeFont=[UIFont systemFontOfSize:14.0];
    _describeColor=[UIColor grayColor];
    _useRuleName=@"《使用规则》";
    _tx_TextAlignment=NSTextAlignmentLeft;
    [self setUseRule];
}
/*设置规则*/
- (void)setUseRule{
    NSString * str=[NSString stringWithFormat:@"%@%@",_describe,_useRuleName];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    [attributedString addAttribute:NSLinkAttributeName
                             value:@"shiYongGuiZe://"
                             range:[[attributedString string] rangeOfString:[NSString stringWithFormat:@"%@",_useRuleName]]];
    [attributedString addAttribute:NSFontAttributeName value:_describeFont range:NSMakeRange(0, attributedString.length)];
    self.attributedText = attributedString;
    self.linkTextAttributes = @{NSForegroundColorAttributeName: _useRuleColor,
                                NSUnderlineColorAttributeName: [UIColor lightGrayColor],
                                NSUnderlineStyleAttributeName: @(NSUnderlinePatternSolid)};
    self.textColor=_describeColor;
    self.textAlignment=_tx_TextAlignment;
}
/*设置描述*/
- (void)setDescribe:(NSString *)describe{
    _describe=describe;
    [self setUseRule];
}
/*设置规则颜色*/
- (void)setUseRuleColor:(UIColor *)useRuleColor{
    _useRuleColor=useRuleColor;
    [self setUseRule];
}
/*设置描述颜色*/
- (void)setDescribeColor:(UIColor *)describeColor{
    _describeColor=describeColor;
    [self setUseRule];
}
/*设置描述字体*/
- (void)setDescribeFont:(UIFont *)describeFont{
    _describeFont=describeFont;
    [self setUseRule];
}
/*使用规则名称*/
- (void)setUseRuleName:(NSString*)useRuleName{
    _useRuleName=useRuleName;
    [self setUseRule];
}
/*设置字体布局*/
- (void)setTx_TextAlignment:(NSTextAlignment)tx_TextAlignment{
    _tx_TextAlignment=tx_TextAlignment;
    [self setUseRule];
}
/*设置完成处理程序*/
- (void)setCompletionHandler:(URCompletionHandler)completionHandler{
    _completionHandler=completionHandler;
    [self setUseRule];
    
}
/*设置设置描述以及完成处理程序*/
- (void)setDescribe:(NSString *)describe completionHandler:(URCompletionHandler)completionHandler{
    [self setCompletionHandler:completionHandler];
    [self setDescribe:describe];
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    if ([[URL scheme] isEqualToString:@"shiYongGuiZe"]) {
        if (_completionHandler) _completionHandler();
        return NO;
    }
    return YES;
}


@end
