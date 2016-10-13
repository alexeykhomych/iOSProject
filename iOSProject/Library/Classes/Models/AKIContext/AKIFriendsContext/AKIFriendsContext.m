//
//  AKIFriendsContext.m
//  iOSProject
//
//  Created by Alexey Khomych on 10.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFriendsContext.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "AKIUser.h"

#import "AKIFBConst.h"

#import "AKIMacro.h"

@implementation AKIFriendsContext

#pragma mark -
#pragma mark Accessors

- (FBSDKGraphRequest *)request {
    return [[FBSDKGraphRequest alloc] initWithGraphPath:kAKIFriendsRequest
                                             parameters:nil
                                             HTTPMethod:kAKIGET];
}

- (id)completionHandler {
    return ^(FBSDKGraphRequestConnection *connection, NSDictionary *result, NSError *error) {
        if (error) {
            return;
        }
        
        NSArray *friends = result[@"data"];
        AKIArrayModel *model = [AKIArrayModel new];
        
        for (NSDictionary *friendsDictionary in friends) {
            AKIUser *friend = [AKIUser new];
            friend.ID = friendsDictionary[@"id"];
            friend.name = friendsDictionary[@"name"];
            
            [model addObject:friend];
        }
        
        [self.user performBlockWithoutNotification:^{
            [self.user.friends addObjects:model.objects];
        }];
        
        self.user.state = AKIModelDidLoad;
    };
}

#pragma mark -
#pragma mark Public

- (void)execute {
    FBSDKGraphRequest *request = [self request];
    [request startWithCompletionHandler:[self completionHandler]];
}

#pragma mark -
#pragma mark Private

- (void)testData {
    for (NSUInteger i = 0; i < 5; i++) {
        AKIUser *friend = [AKIUser new];
        friend.ID = [NSString stringWithFormat:@"%lu", 1234+i];
        friend.name = @"werwerrew";
        friend.birthday = @"24 December 1992";
        [self.user.friends addObject:friend];
    }
}

@end

/*
 {
	"friends": {
 "data": [
 {
 "name": dsada
 "id":dasdsad
 },
 {
 "name":dsad
 "id":dsad
 }
	],
	"paging": {...}
	},
	"id":dsadasd
 }
 */