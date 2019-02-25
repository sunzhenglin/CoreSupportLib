//
//  TXTimer.m
//  FuLing
//
//  Created by komlin on 2017/12/27.
//  Copyright © 2017年 komlin. All rights reserved.
//

#import "TXTimer.h"

@interface TXTimer ()
/** 定时器 */
@property (nonatomic,strong)NSTimer * timer;
/** 是否开始 */
@property (nonatomic,assign)BOOL    isStart;
@end

@implementation TXTimer

/** 对象方法(构造初始化)
 *  @param timeInterval 时间
 */
- (instancetype)initWithTimeInterval:(NSTimeInterval)timeInterval{
    if (self = [super init]) {
        self.timeInterval=timeInterval;
        [self stop];
    }
    return self;
}

/** 类方法(构造初始化)
 *  @param timeInterval 时间
 */
+ (instancetype)timerWithTimeInterval:(NSTimeInterval)timeInterval{
    return [[self alloc]initWithTimeInterval:timeInterval];
}

/** 初始化 */
- (instancetype)init{
    if (self = [super init]) {
        self.timeInterval=5.0;
        [self stop];
    }
    return self;
}

/** 开始倒计时 */
- (void)start{
    if (!self.isStart){
        [self freed];
        self.timer=[NSTimer timerWithTimeInterval:self.timeInterval target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
        self.isStart=YES;
    }
}

/** 停止倒计时 */
- (void)stop{
    [self freed];
    self.isStart = NO;
}

/** 释放倒计时 */
- (void)freed{
    [self.timer invalidate];
    self.timer = nil;
}

/** 定时发射 */
- (void)timerFired:(NSTimer*)timer{
    if (self.timerFired) self.timerFired();
}

/** dealloc */
- (void)dealloc{
    [self stop];
}

@end
