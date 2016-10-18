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

#import "AKIFBConst.h"

#import "AKIGCD.h"

#import "AKIUser.h"

#import "AKIMacro.h"

@implementation AKILoginContext

#pragma mark -
#pragma mark Accessors

- (NSString *)path {
    return [NSString stringWithFormat:@"%@%@", kAKIFBMe, kAKIFBFriendsRequest];
}

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

#pragma mark -
#pragma mark Public

- (void)performExecute {
    AKIWeakify(self);
    AKIAsyncPerformInMainQueue(^{
        AKIStrongifyAndReturnIfNil(self);
        [[FBSDKLoginManager new] logInWithReadPermissions:@[kAKIFBLoginPermissions]
                                       fromViewController:self.controller
                                                  handler:[self completionHandler]];
    });
}

@end
