//
//  AKILoginContext.m
//  iOSProject
//
//  Created by Alexey Khomych on 10.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKILoginContext.h"

#import <FBSDKLoginKit/FBSDKLoginKit.h>

@implementation AKILoginContext

- (void)execute {
    [[FBSDKLoginManager new] logInWithReadPermissions:@[@"public profile"]
                                   fromViewController:(UIViewController *)self.controller
                                              handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                                  if (error || !result) {
                                                      
                                                  }
                                              }];
}

@end
