//
//  NSMutableArray+SafeKit.m
//  DurexKitExample
//
//  Created by zhangyu on 14-3-13.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "NSMutableArray+SafeKit.h"
#import "NSObject+Swizzle.h"
#import "SafeKitLog.h"
#import "NSException+SafeKit.h"

@implementation NSMutableArray(SafeKit)

+ (void) load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self safe_swizzleMethod:@selector(safe_objectAtIndex:) tarClass:@"__NSArrayM" tarSel:@selector(objectAtIndex:)];
        [self safe_swizzleMethod:@selector(safe_arrayByAddingObject:) tarClass:@"__NSArrayM" tarSel:@selector(arrayByAddingObject:)];
        
        [self safe_swizzleMethod:@selector(safe_addObject:) tarClass:@"__NSArrayM" tarSel:@selector(addObject:)];
        [self safe_swizzleMethod:@selector(safe_insertObject:atIndex:) tarClass:@"__NSArrayM" tarSel:@selector(insertObject:atIndex:)];
        [self safe_swizzleMethod:@selector(safe_removeObjectAtIndex:) tarClass:@"__NSArrayM" tarSel:@selector(removeObjectAtIndex:)];
        [self safe_swizzleMethod:@selector(safe_replaceObjectAtIndex:withObject:) tarClass:@"__NSArrayM" tarSel:@selector(replaceObjectAtIndex:withObject:)];
        
        [self safe_swizzleMethod:@selector(safe_setObject:atIndexedSubscript:) tarClass:@"__NSArrayM" tarSel:@selector(setObject:atIndexedSubscript:)];
        [self safe_swizzleMethod:@selector(safe_removeObject:) tarClass:@"__NSArrayM" tarSel:@selector(removeObject:)];
        [self safe_swizzleMethod:@selector(safe_insertObjects:atIndexes:) tarClass:@"__NSArrayM" tarSel:@selector(insertObjects:atIndexes:)];
        
        
    });
}

-(id)safe_objectAtIndex:(NSUInteger)index{
	if (index >= [self count]) {
		[[SafeKitLog shareInstance] logWarning:[NSString stringWithFormat:@"index[%ld] >= count[%ld]",(long)index ,(long)[self count]]];
		return nil;
	}
	return [self safe_objectAtIndex:index];
}

- (NSArray *)safe_arrayByAddingObject:(id)anObject{
    if (!anObject) {
        [[SafeKitLog shareInstance] logWarning:[NSString stringWithFormat:@"object is nil"]];
        return self;
    }
    return [self safe_arrayByAddingObject:anObject];
}

-(void)safe_addObject:(id)anObject{
	if (!anObject) {
		[[SafeKitLog shareInstance]logWarning:@"object is nil"];
		return;
	}
	[self safe_addObject:anObject];
}
- (void)safe_insertObject:(id)anObject atIndex:(NSUInteger)index{
	if (index > [self count]) {
		[[SafeKitLog shareInstance]logWarning:[NSString stringWithFormat:@"index[%ld] > count[%ld]",(long)index ,(long)[self count]]];
		return;
	}
	if (!anObject) {
		[[SafeKitLog shareInstance]logWarning:@"object is nil"];
		return;
	}
	[self safe_insertObject:anObject atIndex:index];
}

- (void)safe_removeObjectAtIndex:(NSUInteger)index{
	if (index >= [self count]) {
		[[SafeKitLog shareInstance]logWarning:[NSString stringWithFormat:@"index[%ld] >= count[%ld]",(long)index ,(long)[self count]]];
		return;
	}
	
	return [self safe_removeObjectAtIndex:index];
}
- (void)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject{
	if (index >= [self count]) {
		[[SafeKitLog shareInstance]logWarning:[NSString stringWithFormat:@"index[%ld] >= count[%ld]",(long)index ,(long)[self count]]];
		return;
	}
	if (!anObject) {
		[[SafeKitLog shareInstance]logWarning:@"object is nil"];
		return;
	}
	[self safe_replaceObjectAtIndex:index withObject:anObject];
}


- (void)safe_setObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
	if (obj == nil || idx >= self.count) {
		@try {
			[self safe_setObject:obj atIndexedSubscript:idx];
		} @catch (NSException *exception) {
			[[SafeKitLog shareInstance] logError:[NSString stringWithFormat:@"Crash Because %@",[exception callStackSymbols]]];
			
		} @finally {
			
		}
		
	} else {
		[self safe_setObject:obj atIndexedSubscript:idx];
	}
	
}

- (void)safe_removeObject:(id)anObject {
	@try {
		[self safe_removeObject:anObject];
	} @catch (NSException *exception) {
		
		[[SafeKitLog shareInstance] logError:[NSString stringWithFormat:@"Crash Because %@",[exception callStackSymbols]]];
		
	} @finally {
		
	}
}

- (void)safe_insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes {
	@try {
		[self safe_insertObjects:objects atIndexes:indexes];
	} @catch (NSException *exception) {
		
		[[SafeKitLog shareInstance] logError:[NSString stringWithFormat:@"Crash Because %@",[exception callStackSymbols]]];
		
	} @finally {
		
	}
}


@end
