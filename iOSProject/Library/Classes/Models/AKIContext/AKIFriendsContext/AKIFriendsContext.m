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

- (id)request {
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
    AKIWeakify(self);
    AKIAsyncPerformInMainQueue(^{
        AKIStrongifyAndReturnIfNil(self);
        [request startWithCompletionHandler:[self completionHandler]];
    });
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

@end
