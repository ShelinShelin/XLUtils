//
//  NSArray+XLSafe.m
//  XLUtils
//
//  Created by Shelin on 17/3/1.
//  Copyright © 2017年 StarUnion. All rights reserved.
//

#import "NSArray+XLSafe.h"
#import "NSObject+XLSwizzleMethod.h"

@implementation NSArray (XLSafe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("__NSArrayI") swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(safeObjectAtIndex:) error:nil];
            
            [objc_getClass("__NSArrayI") swizzleMethod:@selector(subarrayWithRange:) withMethod:@selector(safeSubarrayWithRange:) error:nil];
        };
    });
}


- (id)safeObjectAtIndex:(NSInteger)index {
    if ( index < 0 || index >= self.count) {
        NSLog(@"objectAtIndex - 数组越界");
        return nil;
    }
    return [self safeObjectAtIndex:index];
}

- (NSArray *)safeSubarrayWithRange:(NSRange)range {
    if ( self.count == 0 || range.location >= self.count || range.location + range.length > self.count) {
        NSLog(@"subarrayWithRange - 数组越界");
        return nil;
    }
    return [self safeSubarrayWithRange:NSMakeRange(range.location, range.length)];
}

@end



@implementation NSMutableArray (XLSafe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("__NSArrayM") swizzleMethod:
             @selector(objectAtIndex:) withMethod:@selector(safeObjectAtIndex:) error:nil];
            [objc_getClass("__NSArrayM") swizzleMethod:
             @selector(addObject:) withMethod:@selector(safeAddObject:) error:nil];
        };
    });
}

- (void)safeAddObject:(id)object {
    if (!object) {
        NSLog(@"addObject - nil对象加入数组");
    } else {
        [self safeAddObject:object];
    }
}

- (id)safeObjectAtIndex:(NSInteger)index {
    if ( index < 0 || index >= self.count) {
        NSLog(@"objectAtIndex - 数组越界");
        return nil;
    }
    return [self safeObjectAtIndex:index];
}

@end

