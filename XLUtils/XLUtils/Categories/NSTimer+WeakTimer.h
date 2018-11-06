//
//  NSTimer+WeakTimer.h
//  XLUtils
//
//  Created by xiemingjiang on 2018/11/6.
//  Copyright © 2018年 StarUnion. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (WeakTimer)

+ (NSTimer *)weak_scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                          target:(id)aTarget
                                        selector:(SEL)aSelector
                                        userInfo:(nullable id)userInfo
                                         repeats:(BOOL)yesOrNo;


@end

NS_ASSUME_NONNULL_END
