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

@interface AKIFacebookLoginViewController ()
@property (nonatomic, strong) AKIUser *user;

@end

@implementation AKIFacebookLoginViewController

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
    AKILoginContext *login = [AKILoginContext new];
    [login execute];
    
    AKIFacebookFriendsViewController *controller = [AKIFacebookFriendsViewController viewController];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(AKIUser *)user {
    if (_user != user) {
        [_user removeObserver:self];
        _user = user;
        [_user addObserver:self];
    }
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
