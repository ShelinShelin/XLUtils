//
//  UIColor+XLAdd.h
//  XLUtils
//
//  Created by Shelin on 17/3/1.
//  Copyright © 2017年 StarUnion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (XLAdd)

/**
 *  将16进制字符串转换成UIColor  e.g. #ffffff
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHexString:(NSString *)color;

@end
