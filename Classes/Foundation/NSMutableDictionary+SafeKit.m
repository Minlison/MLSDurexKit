//
//  NSMutableDictionary+SafeKit.m
//  DurexKitExample
//
//  Created by zhangyu on 14-3-13.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "NSMutableDictionary+SafeKit.h"
#import "NSObject+Swizzle.h"
#import "SafeKitLog.h"
#import "NSException+SafeKit.h"

@implementation NSMutableDictionary(SafeKit)

- (void)safe_removeObjectForKey:(id)aKey{
    if (!aKey) {
        [[SafeKitLog shareInstance]logWarning:@"key is nil"];
        return;
    }
    [self safe_removeObjectForKey:aKey];
}

- (void)safe_setObject:(id)anObject forKey:(id <NSCopying>)aKey{
    if (!anObject) {
        [[SafeKitLog shareInstance]logWarning:@"object is nil"];
        return;
    }
    if (!aKey) {
        [[SafeKitLog shareInstance]logWarning:@"key is nil"];
        return;
    }
    [self safe_setObject:anObject forKey:aKey];
}

+ (void) load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self safe_swizzleMethod:@selector(safe_removeObjectForKey:) tarClass:@"__NSDictionaryM" tarSel:@selector(removeObjectForKey:)];
        [self safe_swizzleMethod:@selector(safe_setObject:forKey:) tarClass:@"__NSDictionaryM" tarSel:@selector(setObject:forKey:)];
    });
}
@end
