//
//  NSObject+Safe.m
//  XLUtils
//
//  Created by vipkid on 2018/11/6.
//  Copyright © 2018年 StarUnion. All rights reserved.
//

#import "NSObject+Safe.h"
#import <objc/runtime.h>
#import <Foundation/Foundation.h>

static NSString *dataKey = @"key";

@interface NSObject ()

@property (strong, nonatomic) NSMutableDictionary *data;

@end

@implementation NSObject (Safe)

#pragma mark - LifeCycle

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
    @synchronized([self class]) {
        NSString *selString = NSStringFromSelector(selector);
        NSMethodSignature *signature = nil;
        
        NSRange range = [selString rangeOfString:@"set"];
        
        if (range.length) {
            signature = [NSMethodSignature signatureWithObjCTypes:"v@:@"];
        } else {
            signature = [NSMethodSignature signatureWithObjCTypes:"@@:"];
        }
        
        return signature;
    }
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    NSString *key = NSStringFromSelector(invocation.selector);
    
    NSRange range = [key rangeOfString:@"set"];
    
    if (range.length) {
        key = [[key substringFromIndex:3] lowercaseString];
        id obj;
        [invocation getArgument:&obj atIndex:2];
        [self.data setObject:obj forKey:key];
    } else {
        id obj = self.data[key];
        [invocation setReturnValue:&obj];
    }
    
}

#pragma mark - Private

- (NSMutableDictionary *)data {
    
    NSMutableDictionary *data = objc_getAssociatedObject(self, &dataKey);
    while (!data) {
        objc_setAssociatedObject(self, &dataKey, [NSMutableDictionary dictionary], OBJC_ASSOCIATION_COPY_NONATOMIC);
        data = objc_getAssociatedObject(self, &dataKey);
    }
    
    return data;
}

#pragma clang diagnostic pop

@end
