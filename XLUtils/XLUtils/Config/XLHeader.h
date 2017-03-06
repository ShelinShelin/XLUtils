//
//  XLHeader.h
//  XLUtils
//
//  Created by Shelin on 17/3/6.
//  Copyright © 2017年 StarUnion. All rights reserved.
//

#ifndef XLHeader_h
#define XLHeader_h

#define WeakObj(o) @autoreleasepool{} __weak typeof(o) weak##o = o
#define StrongObj(o) @autoreleasepool{} __strong typeof(o) strong##o = weak##o  // 与WeakObj(o)成对配合使用




#endif /* XLHeader_h */
