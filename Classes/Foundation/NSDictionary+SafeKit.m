//
//  NSDictionary+SafeKit.m
//  DurexKitExample
//
//  Created by zhangyu on 14-3-13.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "NSDictionary+SafeKit.h"
#import "SafeKitLog.h"
#import "NSObject+Swizzle.h"
@implementation NSDictionary(SafeKit)
+ (void)load
{
	static dispatch_once_t onceTokend;
	dispatch_once(&onceTokend, ^{
		[self safe_swizzleMethod:@selector(SKinitWithObjects:forKeys:count:) tarClass:@"__NSPlaceholderDictionary" tarSel:@selector(initWithObjects:forKeys:count:)];
		[self safe_swizzleMethod:@selector(SKdictionaryWithObjects:forKeys:count:) tarClass:@"__NSPlaceholderDictionary" tarSel:@selector(dictionaryWithObjects:forKeys:count:)];
	});
}
- (instancetype)SKinitWithObjects:(const id _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying> _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt
{
	@try {
		return [self SKinitWithObjects:objects forKeys:keys count:cnt];
	} @catch (NSException *exception) {
		[[SafeKitLog shareInstance] logError:[NSString stringWithFormat:@"Crash Because %@",[exception callStackSymbols]]];
		
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored"-Wincompatible-pointer-types-discards-qualifiers"
//
//        __unsafe_unretained id *unsafe_objects = objects;
//        __unsafe_unretained id *unsafe_keys = keys;
//
//#pragma clang diagnostic pop
        NSMutableDictionary *realDict = [NSMutableDictionary dictionaryWithCapacity:cnt];
		for (NSUInteger i = 0; i < cnt; i ++) {
			
			if (keys[i] && objects[i])
			{
                realDict[keys[i]] = objects[i];
			}
		}
		return [self initWithDictionary:realDict copyItems:NO];
	} @finally {
	}
}
+ (instancetype)SKdictionaryWithObjects:(const id _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying> _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt
{
	@try {
		return [self SKdictionaryWithObjects:objects forKeys:keys count:cnt];
	} @catch (NSException *exception) {
		
		[[SafeKitLog shareInstance] logError:[NSString stringWithFormat:@"Crash Because %@",[exception callStackSymbols]]];
		
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored"-Wincompatible-pointer-types-discards-qualifiers"
//
//        __unsafe_unretained id *unsafe_objects = objects;
//        __unsafe_unretained id *unsafe_keys = keys;
//
//#pragma clang diagnostic pop
        NSMutableDictionary *realDict = [NSMutableDictionary dictionaryWithCapacity:cnt];
        for (NSUInteger i = 0; i < cnt; i ++) {
            
            if (keys[i] && objects[i])
            {
                realDict[keys[i]] = objects[i];
            }
        }
        return [self dictionaryWithDictionary:realDict];
//        for (NSUInteger i = 0; i < cnt; i ++)
//        {
//
//            if (!unsafe_keys[i])
//            {
//                unsafe_keys[i] = @"";
//            }
//            if (!unsafe_objects[i])
//            {
//                unsafe_objects[i] = @"";
//            }
//        }
//
//        return [self SKdictionaryWithObjects:unsafe_objects forKeys:unsafe_keys count:cnt];
		
	}
	@finally
	{
	}
}
@end
