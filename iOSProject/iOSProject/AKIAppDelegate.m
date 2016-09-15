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

#import "AKIMacro.h"

@interface AKIAppDelegate ()
@property (nonatomic, strong) AKIUsersViewController *controller;

@end

@implementation AKIAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    AKIUsersViewController *controller = [AKIUsersViewController viewController];
    
    controller.model = [[AKIUsersArrayModel alloc] init];
    
    window.rootViewController = controller;
    
    self.controller = controller;
    
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    AKIPrintMethod
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    AKIPrintMethod
    
    [self.controller.model save];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    AKIPrintMethod
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    AKIPrintMethod
    
    [self.controller.model load];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    AKIPrintMethod
}

#pragma mark -
#pragma mark Application state

- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder
{
    AKIPrintMethod
    
    return YES;
}

- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder
{
    AKIPrintMethod
    
    return YES;
}

@end
