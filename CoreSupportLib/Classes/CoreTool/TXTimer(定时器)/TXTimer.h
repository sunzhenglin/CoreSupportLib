//
//  TXTimer.h
//  FuLing
//
//  Created by komlin on 2017/12/27.
//  Copyright © 2017年 komlin. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 定时发送 */
typedef void (^TXTimerFired) (void);

/** 定时器 */
@interface TXTimer : NSObject
/** 定时发送代码块 */
@property (nonatomic,copy)TXTimerFired timerFired;
/** 定时发送时间 */
@property (nonatomic,assign)NSTimeInterval timeInterval;

/** 对象方法(构造初始化)
 *  @param timeInterval 时间
 */
- (instancetype)initWithTimeInterval:(NSTimeInterval)timeInterval;

/** 类方法(构造初始化)
 *  @param timeInterval 时间
 */
+ (instancetype)timerWithTimeInterval:(NSTimeInterval)timeInterval;

/** 开始倒计时 */
-(void)start;

/** 停止倒计时 */
- (void)stop;

@end
