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

AKIStringConstant(PerformDataSave, @"performDataSave");

@interface AKIAppDelegate ()
@property (nonatomic, strong) AKIUsersArrayModel *model;

@end

@implementation AKIAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    AKIUsersViewController *controller = [AKIUsersViewController viewController];
    
    window.rootViewController = controller;
    
    id model = [[AKIUsersArrayModel alloc] init];
    controller.model = model;
    self.model = model;
    
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    AKIPrintMethod
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    AKIPrintMethod
    [[NSNotificationCenter defaultCenter] postNotificationName:kAKIPerformDataSave object:nil];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    AKIPrintMethod
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    AKIPrintMethod
}

- (void)applicationWillTerminate:(UIApplication *)application {
    AKIPrintMethod
    [[NSNotificationCenter defaultCenter] postNotificationName:kAKIPerformDataSave object:nil];
}

@end
