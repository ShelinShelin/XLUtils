//
//  NSString+XLSafe.m
//  XLUtils
//
//  Created by Shelin on 17/3/1.
//  Copyright © 2017年 StarUnion. All rights reserved.
//

#import "NSString+XLSafe.h"
#import "NSObject+XLSwizzleMethod.h"

@implementation NSString (XLSafe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("__NSCFConstantString") swizzleMethod:@selector(substringFromIndex:) withMethod:@selector(safeSubstringFromIndex:) error:nil];
            
            [objc_getClass("__NSCFConstantString") swizzleMethod:@selector(substringToIndex:) withMethod:@selector(safeSubstringToIndex:) error:nil];
            
            [objc_getClass("__NSCFConstantString") swizzleMethod:@selector(substringWithRange:) withMethod:@selector(safeSubstringWithRange:) error:nil];
        };
    });
}

- (NSString *)safeSubstringFromIndex:(NSInteger)from {
    NSInteger length = self.length;
    
    if (from > length || from < 0) {
        NSLog(@"substringFromIndex - 字符串越界！");
        return @"";
    }
    return [self safeSubstringFromIndex:from];
}

- (NSString *)safeSubstringToIndex:(NSInteger)to {
    NSInteger length = self.length;
    
    if (to > length || to < 0) {
        NSLog(@"substringToIndex - 字符串越界！");
        return @"";
    }
    return [self safeSubstringToIndex:to];
}

- (NSString *)safeSubstringWithRange:(NSRange)range {
    NSInteger length = self.length;
    if ((range.location + range.length) > length) {
        NSLog(@"substringWithRange - 字符串越界！");
        return @"";
    }
    return [self safeSubstringWithRange:range];
}


@end
