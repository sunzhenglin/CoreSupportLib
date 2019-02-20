//
//  LBXDIYScanViewController.m
//  SchoolWatchParent
//
//  Created by komlin on 2018/7/23.
//  Copyright © 2018年 Komlin. All rights reserved.
//

#import "LBXDIYScanViewController.h"

@interface LBXDIYScanViewController ()

@end

@implementation LBXDIYScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.cameraInvokeMsg = @"相机启动中...";
}

#pragma mark -实现类继承该方法，作出对应处理
- (void)scanResultWithArray:(NSArray<LBXScanResult*>*)array{
    if (!array ||  array.count < 1){
        [self scanResult:nil error:[NSError errorWithDomain:@"ScanFailure" code:-10000 userInfo:@{@"msg":@"识别失败"}]];
        return;
    }
    LBXScanResult *scanResult = array[0];
    NSString*strResult = scanResult.strScanned;
    self.scanImage = scanResult.imgScanned;
    if (!strResult) {
        [self scanResult:nil error:[NSError errorWithDomain:@"ScanFailure" code:-10000 userInfo:@{@"msg":@"识别失败"}]];
        return;
    }
    //TODO: 这里可以根据需要自行添加震动或播放声音提示相关代码
    [self scanResult:scanResult error:nil];
}

/*扫描结果*/
- (void)scanResult:(LBXScanResult*)scanResult error:(NSError*)error{}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
