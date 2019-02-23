//
//  KLViewController.m
//  CoreSupportLib
//
//  Created by acct<blob>=0xE7A9BAE781B5E699BAE883BD on 02/19/2019.
//  Copyright (c) 2019 acct<blob>=0xE7A9BAE781B5E699BAE883BD. All rights reserved.
//

#import "KLViewController.h"
#import "CoreSupport.h"
@interface KLViewController ()

@end

@implementation KLViewController
- (IBAction)show:(id)sender {
    NSDateFormatter *minDateFormater=[[NSDateFormatter alloc] init];
    [minDateFormater setDateFormat:@"yyyy-MM-dd"];
    NSDate *scrollToDate=[minDateFormater dateFromString:[self getCurrentTime]];
    WSDatePickerView *datepicker=[[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDay scrollToDate:scrollToDate CompleteBlock:^(NSDate *selectDate) {
        
    }];
    datepicker.dateLabelColor=TXRGB(65, 188, 241);//年-月-日-时-分 颜色
    datepicker.datePickerColor=[UIColor blackColor];//滚轮日期颜色
    datepicker.doneButtonColor=TXRGB(65, 188, 241);//确定按钮的颜色
    datepicker.hideBackgroundYearLabel = YES;//隐藏背景年份文字
    [datepicker show];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
	// Do any additional setup after loading the view, typically from a nib.
}
/** 获取当地时间 */
- (NSString *)getCurrentTime {
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateTime=[formatter stringFromDate:[NSDate date]];
    return dateTime;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
