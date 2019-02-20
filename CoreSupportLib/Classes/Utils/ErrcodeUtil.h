//
//  ErrcodeUtil.h
//  TeacherWatch
//
//  Created by Zlin Sun on 2018/8/31.
//  Copyright © 2018年 Zlin Sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ErrcodeUtil : NSObject
+(ErrcodeUtil *) sharedInstance;
-(NSString *)msg:(int)errcode;
@end
