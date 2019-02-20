//
//  TXUseRuleView.h
//  TXUseRuleView
//
//  Created by xtz_pioneer on 2018/7/9.
//  Copyright © 2018年 Komlin. All rights reserved.
//
#import <UIKit/UIKit.h>

/*完成回调*/
typedef void (^URCompletionHandler) (void);

@interface TXUseRuleView : UITextView

/*设置描述*/
- (void)setDescribe:(NSString *)describe;
/*设置规则颜色*/
- (void)setUseRuleColor:(UIColor *)useRuleColor;
/*设置描述颜色*/
- (void)setDescribeColor:(UIColor *)describeColor;
/*设置描述字体*/
- (void)setDescribeFont:(UIFont *)describeFont;
/*使用规则名称*/
- (void)setUseRuleName:(NSString*)useRuleName;
/*设置字体布局*/
- (void)setTx_TextAlignment:(NSTextAlignment)tx_TextAlignment;
/*设置完成处理程序*/
- (void)setCompletionHandler:(URCompletionHandler)completionHandler;
/*设置设置描述以及完成处理程序*/
- (void)setDescribe:(NSString *)describe completionHandler:(URCompletionHandler)completionHandler;

@end
