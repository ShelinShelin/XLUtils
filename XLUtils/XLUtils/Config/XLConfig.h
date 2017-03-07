//
//  XLConfig.h
//  XLUtils
//
//  Created by Shelin on 17/3/7.
//  Copyright © 2017年 StarUnion. All rights reserved.
//

#ifndef XLConfig_h
#define XLConfig_h

#if DEV_VERSION //开发环境

#define kBaseURL @"开发环境"

#elif TESTER_VERSION //测试环境

#define kBaseURL @"测试环境"

#else //正式生产环境

#define kBaseURL @"正式生产环境"

#endif


#endif /* XLConfig_h */
