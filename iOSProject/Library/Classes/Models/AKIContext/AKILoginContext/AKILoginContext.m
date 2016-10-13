//
//  AKILoginContext.m
//  iOSProject
//
//  Created by Alexey Khomych on 10.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKILoginContext.h"

#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "AKIUser.h"

#import "AKIFBConst.h"

#import "AKIFacebookLoginViewController.h"

#import "AKIMacro.h"

@implementation AKILoginContext

#pragma mark -
#pragma mark Accessors

- (id)completionHandler {
    return ^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        AKIUser *user = self.user;
        
        if (error || !result) {
            user.state = AKIModelDidFailLoading;
            
            return;
        }
        
        user.ID = result.token.userID;
        user.state = AKIModelDidLoad;
    };
}

- (id)permission {
    return @[kAKILoginPermissions];
}

#pragma mark -
#pragma mark Public

- (void)execute {
    [[FBSDKLoginManager new] logInWithReadPermissions:[self permission]
                                   fromViewController:self.controller
                                              handler:[self completionHandler]];
}

@end
