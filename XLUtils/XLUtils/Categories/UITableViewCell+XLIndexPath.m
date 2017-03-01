//
//  UITableViewCell+XLIndexPath.m
//  XLUtils
//
//  Created by Shelin on 17/3/1.
//  Copyright © 2017年 StarUnion. All rights reserved.
//

#import "UITableViewCell+XLIndexPath.h"
#import <objc/runtime.h>

@implementation UITableViewCell (XLIndexPath)

- (NSIndexPath *)indexPath {
    return objc_getAssociatedObject(self, @selector(indexPath));
}

- (void)setIndexPath:(NSIndexPath *)indexPath {
    objc_setAssociatedObject(self, @selector(indexPath), indexPath, OBJC_ASSOCIATION_RETAIN);
}

@end
