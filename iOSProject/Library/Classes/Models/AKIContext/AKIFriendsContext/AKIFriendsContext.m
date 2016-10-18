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

#import "AKIGCD.h"

#import "AKIArrayModel.h"

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

- (NSDictionary *)parameters {
    return @{@"fields": @"id,name,picture{url}",};
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
#pragma mark Private

- (void)parseData:(NSDictionary *)data {
    NSArray *friends = data[kAKIFBData];
    AKIArrayModel *model = self.model;
    
    for (NSDictionary *friendsDictionary in friends) {
        AKIUser *friend = [AKIUser new];
        friend.ID = friendsDictionary[kAKIFBID];
        friend.name = friendsDictionary[kAKIFBName];
        
        NSDictionary *picture = friendsDictionary[kAKIFBPicture][kAKIFBData];
        friend.url = [NSURL URLWithString:picture[kAKIFBURL]];
        
        [model addObject:friend];
    }
    
    [model performBlockWithoutNotification:^{
        [model addObjects:model.objects];
    }];
    
    model.state = AKIModelDidLoad;
}

@end
