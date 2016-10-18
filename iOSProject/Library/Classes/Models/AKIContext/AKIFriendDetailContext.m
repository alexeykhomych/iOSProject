//
//  AKIFriendDetailContext.m
//  iOSProject
//
//  Created by Alexey Khomych on 17.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFriendDetailContext.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "AKIUser.h"

#import "AKIFBConst.h"

#import "AKIGCD.h"

#import "AKIMacro.h"

@interface AKIFriendDetailContext ()

- (void)parseData:(NSDictionary *)data;

@end

@implementation AKIFriendDetailContext

#pragma mark -
#pragma mark Accessors

- (NSDictionary *)parameters {
    return @{ @"fields": @"picture.type(large)",};
}

- (NSString *)path {
    return [NSString stringWithFormat:@"/%@", self.user.ID];
}

- (id)completionHandler {
    return ^(FBSDKGraphRequestConnection *connection, NSDictionary *result, NSError *error) {
        if (error) {
            self.user.state = AKIModelDidFailLoading;
            
            return;
        }
        
        [self parseData:result];
    };
}

#pragma mark -
#pragma mark Private

- (void)parseData:(NSDictionary *)data {
    AKIUser *user = self.user;
    
    NSDictionary *picture = data[kAKIFBPicture];
    NSDictionary *data2 = picture[kAKIFBData];
    
//    user.url = data2[kAKIFBURL];
    
    user.state = AKIModelDidLoad;
}

@end
