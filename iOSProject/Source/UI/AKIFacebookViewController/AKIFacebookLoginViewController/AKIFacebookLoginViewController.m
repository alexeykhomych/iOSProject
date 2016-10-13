//
//  AKIFacebookLoginViewController.m
//  iOSProject
//
//  Created by Alexey Khomych on 09.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFacebookLoginViewController.h"

#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "AKILoginContext.h"

#import "AKIUser.h"

#import "AKIFacebookFriendsViewController.h"

#import "UIViewController+AKIExtensions.h"

@implementation AKIFacebookLoginViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    self.user = [AKIUser new];
    
    return self;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onLoginButton:(id)sender {
    [self loadContext];
    [self.context execute];
    
    AKIFacebookFriendsViewController *controller = [AKIFacebookFriendsViewController viewController];
    controller.user = self.user;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark Public

- (void)loadContext {
    AKILoginContext *loginContext = [AKILoginContext new];
    loginContext.user = self.user;
    loginContext.controller = self;
    
    self.context = loginContext;
}

@end
