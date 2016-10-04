//
//  AKIAppDelegate.m
//  iOSProject
//
//  Created by Alexey Khomych on 27.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIAppDelegate.h"

#import "AKIUsersViewController.h"

#import "AKIUsersArrayModel.h"

#import "UIWindow+AKIExtensions.h"

#import "UIViewController+AKIExtensions.h"

@implementation AKIAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    AKIUsersViewController *controller = [AKIUsersViewController viewController];
    
    window.rootViewController = controller;
    
    [window makeKeyAndVisible];
    
    controller.model = [[AKIUsersArrayModel alloc] init];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
