//
//  NSTimer+WeakTimer.m
//  XLUtils
//
//  Created by xiemingjiang on 2018/11/6.
//  Copyright © 2018年 StarUnion. All rights reserved.
//

#import "NSTimer+WeakTimer.h"

@interface XLTimerTempObj : NSObject

@property (nonatomic, weak) id target;
@property (nonatomic, weak) NSTimer *timer;
@property (nonatomic, assign) SEL sel;

- (void)fire:(NSTimer *)timer;

@end

@implementation XLTimerTempObj

- (void)fire:(NSTimer *)timer {
    if (self.target) {
        if ([self.target respondsToSelector:self.sel]) {
            
            if (!self.target) return;
            IMP imp = [self.target methodForSelector:self.sel];
            void (*func)(id, SEL, NSTimer *) = (void *)imp;
            func(self.target, self.sel, timer);
            
        } else {
            [self.timer invalidate];
        }
    }
}

@end


@implementation NSTimer (WeakTimer)

+ (NSTimer *)weak_scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                          target:(id)aTarget
                                        selector:(SEL)aSelector
                                        userInfo:(id)userInfo
                                         repeats:(BOOL)yesOrNo {
    
    XLTimerTempObj *tempObj = [[XLTimerTempObj alloc] init];
    
    tempObj.target = aTarget;
    tempObj.sel = aSelector;
    tempObj.timer = [NSTimer scheduledTimerWithTimeInterval:ti target:tempObj selector:@selector(fire:) userInfo:userInfo repeats:yesOrNo];
    
    return tempObj.timer;
    
}

@end
