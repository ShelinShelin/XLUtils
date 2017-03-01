//
//  NSObject+XLSwizzleMethod.h
//  XLUtils
//
//  Created by Shelin on 17/3/1.
//  Copyright © 2017年 StarUnion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (XLSwizzleMethod)

/**
 @method swizzleMethod:withMethod:error:
 @abstract 对系统方法进行替换
 @param swizzledSelector 想要替换的方法
 @param originalSelector 实际替换为的方法
 @param error 替换过程中出现的错误，如果没有错误为nil
 */
+ (BOOL)swizzleMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector error:(NSError **)error;

@end
