//
//  AppDelegate.m
//  MLSDurexKitDemo
//
//  Created by yuanhang on 2019/10/10.
//  Copyright © 2019 minlison. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = ViewController.new;
    [self.window makeKeyAndVisible];
    return YES;
}
@end
