//
//  NSNull+Safe.m
//  苗木--iOS
//
//  Created by yanghaha on 15/11/26.
//  Copyright © 2015年 shuogao. All rights reserved.
//

//#import "NSNull+Safe.h"
#import <objc/runtime.h>
#import <Foundation/Foundation.h>
static NSString *dataKey = @"key";

@interface NSNull ()

@property (strong, nonatomic) NSMutableDictionary *data;

@end

@implementation NSNull (Safe)

#pragma mark - LifeCycle

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    @synchronized([self class])
    {
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

- (void)forwardInvocation:(NSInvocation *)invocation
{
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


@end
