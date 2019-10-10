//
//  Foundation+SafeKit.h
//  SafeKitExample
//
//  Created by zhangyu on 14-2-28.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#if __has_include("Foundation+SafeKit.h")
    #import "NSObject+SafeKit.h"

    #import "NSArray+SafeKit.h"
    #import "NSMutableArray+SafeKit.h"

    #import "NSDictionary+SafeKit.h"
    #import "NSMutableDictionary+SafeKit.h"

    #import "NSString+SafeKit.h"
    #import "NSMutableString+SafeKit.h"
#else
    #import <MLSDurexKit/NSObject+SafeKit.h>

    #import <MLSDurexKit/NSArray+SafeKit.h>
    #import <MLSDurexKit/NSMutableArray+SafeKit.h>

    #import <MLSDurexKit/NSDictionary+SafeKit.h>
    #import <MLSDurexKit/NSMutableDictionary+SafeKit.h>

    #import <MLSDurexKit/NSString+SafeKit.h>
    #import <MLSDurexKit/NSMutableString+SafeKit.h>

#endif
