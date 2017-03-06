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

#ifdef DEBUG    //调试debug
#define RBLog(...) NSLog(__VA_ARGS__)
#else   //发布release
#define XLLog(...)
#endif

/**
 *  物理屏幕宽高
 */
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

/**
 *  5 / 5s width
 */
#define isIPhone5 (kScreenWidth <= 320)
#define isIPhone6 (kScreenWidth <= 375 && kScreenWidth > 320)
#define isIPhone6Plus (kScreenWidth > 375 && kScreenWidth <=414)

/**
 *  导航栏和标签栏高度
 */
#define kNavigationStatusBarHeight 64.0f
#define kTabBarHeight 49.0f

/**
 *  判断设备是否是模拟器
 */
#define isIphoneSimulator TARGET_IPHONE_SIMULATOR

/**
 *  设备系统是否大于iOS6
 */
#define isAfterIOS7 ([[[UIDevice currentDevice] systemVersion] intValue] > 7)

/**
 角度转弧度
 */
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)


#endif /* XLHeader_h */
