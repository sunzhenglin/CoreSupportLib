//
//  LBXDIYScanViewController.h
//  SchoolWatchParent
//
//  Created by komlin on 2018/7/23.
//  Copyright © 2018年 Komlin. All rights reserved.
//

#import "LBXScanViewController.h"

@interface LBXDIYScanViewController : LBXScanViewController
/*扫描结果*/
- (void)scanResult:(LBXScanResult*)scanResult error:(NSError*)error;
@end
