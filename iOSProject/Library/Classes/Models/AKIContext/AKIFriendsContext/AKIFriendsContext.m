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

@interface AKIFriendsContext ()
@property (nonatomic, strong) AKIArrayModel *model;

- (void)parseData:(NSDictionary *)data;

@end

@implementation AKIFriendsContext

@synthesize model = _model;

#pragma mark -
#pragma mark Accessors

- (NSString *)path {
    return [NSString stringWithFormat:@"%@%@", kAKIFBMe, kAKIFBFriendsRequest];
}

- (FBSDKGraphRequest *)request {
    return [[FBSDKGraphRequest alloc] initWithGraphPath:self.path
                                             parameters:nil
                                             HTTPMethod:kAKIFBGET];
}

- (id)completionHandler {
    return ^(FBSDKGraphRequestConnection *connection, NSDictionary *result, NSError *error) {
        if (error) {
            self.model.state = AKIModelDidFailLoading;
            
            return;
        } 
        
        [self parseData:result];
    };
}

#pragma mark -
#pragma mark Public

- (void)performExecute {
    FBSDKGraphRequest *request = [self request];
    [request startWithCompletionHandler:[self completionHandler]];
}

#pragma mark -
#pragma mark Private

- (void)parseData:(NSDictionary *)data {
    NSArray *friends = data[kAKIFBData];
    AKIArrayModel *model = [AKIArrayModel new];
    
    for (NSDictionary *friendsDictionary in friends) {
        AKIUser *friend = [AKIUser new];
        friend.ID = friendsDictionary[kAKIFBID];
        friend.name = friendsDictionary[kAKIFBName];
        
        [model addObject:friend];
    }
    
    [self.model performBlockWithoutNotification:^{
        [self.model addObjects:model.objects];
    }];
    
    self.model.state = AKIModelDidLoad;
}

- (void)testData {
    for (NSUInteger i = 0; i < 5; i++) {
        AKIUser *friend = [AKIUser new];
        friend.ID = [NSString stringWithFormat:@"%lu", 1234+i];
        friend.name = @"werwerrew";
        friend.birthday = @"24 December 1992";
        [self.model addObject:friend];
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