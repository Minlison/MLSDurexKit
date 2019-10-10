//
//  NSArray+SafeKit.m
//  SafeKitExample
//
//  Created by zhangyu on 14-2-28.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "NSArray+SafeKit.h"
#import "NSObject+Swizzle.h"
#import "SafeKitLog.h"
#import "NSException+SafeKit.h"

@implementation NSArray(SafeKit)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self safe_swizzleMethod:@selector(initWithObjects_safe:count:) tarClass:@"__NSPlaceholderArray" tarSel:@selector(initWithObjects:count:)];
        [self safe_swizzleMethod:@selector(safe_objectAtIndex:) tarClass:@"__NSArrayI" tarSel:@selector(objectAtIndex:)];
        [self safe_swizzleMethod:@selector(safe_arrayByAddingObject:) tarClass:@"__NSArrayI" tarSel:@selector(arrayByAddingObject:)];
        [self safe_swizzleMethod:@selector(safe_arrayWithObjects:count:) tarClass:@"__NSArrayI" tarSel:@selector(arrayWithObjects:count:)];
        
        // FIXED: ios 11 crash: index 0 beyond bounds for empty array
        [self safe_swizzleMethod:@selector(safe_objectAtIndexedSubscript:) tarClass:@"__NSArrayM" tarSel:@selector(objectAtIndexedSubscript:)];
        [self safe_swizzleMethod:@selector(safe_objectAtIndexForNSArray0:) tarClass:@"__NSArray0" tarSel:@selector(objectAtIndex:)];
    });
}

- (instancetype)initWithObjects_safe:(const id *)objects count:(NSUInteger)cnt {
    @try {
        return [self initWithObjects_safe:objects count:cnt];
    } @catch (NSException *exception) {
        NSMutableArray <id>*reallArray = [NSMutableArray arrayWithCapacity:cnt];
        for (NSUInteger i = 0; i < cnt; i++) {
            if (objects[i]) {
                [reallArray addObject:objects[i]];
            }
        }
        return [self initWithArray:reallArray copyItems:NO];
    } @finally {
    }
}

- (id)safe_objectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        return nil;
    }
    return [self safe_objectAtIndex:index];
}

- (id)safe_objectAtIndexedSubscript:(NSUInteger)index {
    if (index >= [self count]) {
        return nil;
    }
    return [self safe_objectAtIndexedSubscript:index];
}

- (id)safe_objectAtIndexForNSArray0:(NSUInteger)index {
    if (index >= [self count]) {
        return nil;
    }
    return [self safe_objectAtIndexForNSArray0:index];
}

- (NSArray *)safe_arrayByAddingObject:(id)anObject {
    if (!anObject) {
        return self;
    }
    return [self safe_arrayByAddingObject:anObject];
}


+ (instancetype)safe_arrayWithObjects:(const id _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt
{
	@try {
		return [self safe_arrayWithObjects:objects count:cnt];
	} @catch (NSException *exception) {
		[[SafeKitLog shareInstance] logError:[NSString stringWithFormat:@"Crash Because %@",[exception callStackSymbols]]];
        NSMutableArray *realArray = [NSMutableArray arrayWithCapacity:cnt];
        for (NSUInteger i = 0; i < cnt; i ++) {
            if (objects[i])
            {
                [realArray addObject:objects[i]];
            }
        }
        return [self arrayWithArray:realArray];
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored"-Wincompatible-pointer-types-discards-qualifiers"
//
//        __unsafe_unretained id *unsafe_objects = objects;
//
//#pragma clang diagnostic pop
		
		
	} @finally {
	}
	
}
@end
