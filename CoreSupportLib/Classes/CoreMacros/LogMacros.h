//
//  LogMacros.h
//  Furling
//
//  Created by xtz_pioneer on 2018/6/12.
//  Copyright © 2018年 zhangxiong. All rights reserved.
//

#ifndef LogMacros_h
#define LogMacros_h
/*DEBUG打印日志*/
#if DEBUG
#define TXLog(s, ... ) NSLog( @"<FileName:%@ InThe:%dRow> Log:%@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define TXLog(s, ... )
#endif
#endif /* LogMacros_h */
