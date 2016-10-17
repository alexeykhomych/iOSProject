//
//  AKIFacebookLoginViewController.m
//  iOSProject
//
//  Created by Alexey Khomych on 09.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFacebookLoginViewController.h"

#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "AKIFacebookFriendsViewController.h"

#import "AKILoginContext.h"

#import "AKIUser.h"

#import "AKIGCD.h"

#import "UIViewController+AKIExtensions.h"

#import "AKIMacro.h"

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
    self.user = [AKIUser new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onLoginButton:(id)sender {
    [self loadContext];
}

#pragma mark -
#pragma mark Public

- (void)loadContext {
    AKILoginContext *loginContext = [AKILoginContext new];
    loginContext.user = self.user;
    loginContext.controller = self;
    
    self.context = loginContext;
    
    [self.context execute];
}


#pragma mark -
#pragma mark Observing

- (void)modelDidLoad:(AKIUser *)user {
    AKIWeakify(self);
    AKIAsyncPerformInMainQueue(^{
        AKIStrongifyAndReturnIfNil(self);
        AKIFacebookFriendsViewController *controller = [AKIFacebookFriendsViewController viewController];
        controller.model = self.user.friends;
        
        [self.navigationController pushViewController:controller animated:YES];
    });
}

- (void)modelDidFailLoading:(AKIUser *)user {
    [self loadCachedData];
}

#pragma mark -
#pragma mark Private

- (void)loadCachedData {
    
}

@end
