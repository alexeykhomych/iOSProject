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

#import "AKIMacro.h"

AKIStringConstant(LoginPermissions, @"public_profile");

@implementation AKILoginContext

- (void)execute {
    [[FBSDKLoginManager new] logInWithReadPermissions:@[kAKILoginPermissions]
                                   fromViewController:(UIViewController *)self.controller
                                              handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                                  AKIUser *user = self.user;
                                                  
                                                  if (error || !result) {
                                                      user.state = AKIModelDidFailLoading;
                                                  }
                                                  
                                                  user.ID = result.token.userID;
                                                  user.state = AKIModelDidLoad;
                                              }];
}

@end
