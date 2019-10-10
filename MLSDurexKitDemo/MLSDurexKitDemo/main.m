//
//  main.m
//  MLSDurexKitDemo
//
//  Created by yuanhang on 2019/10/10.
//  Copyright © 2019 minlison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <MLSDurexKit/MLSDurexKit.h>
int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        setSafeKitLogType(SafeKitLogTypeInfo | SafeKitLogTypeError | SafeKitLogTypeWarning);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
