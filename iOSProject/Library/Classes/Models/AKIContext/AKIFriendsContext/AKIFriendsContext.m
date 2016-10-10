//
//  AKIFriendsContext.m
//  iOSProject
//
//  Created by Alexey Khomych on 10.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFriendsContext.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface AKIFriendsContext ()
@property (nonatomic, strong) NSMutableArray *mutableFriends;

@end

@implementation AKIFriendsContext

#pragma mark -
#pragma mark Accessors

- (NSArray *)friends {
    return [self.mutableFriends copy];
}

#pragma mark -
#pragma mark Public

- (void)execute {
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:@"/me/friends"
                                  parameters:nil
                                  HTTPMethod:@"GET"];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        
    }];
}

@end
