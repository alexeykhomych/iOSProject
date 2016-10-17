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

#import "AKIMacro.h"

@interface AKIFriendDetailContext ()
@property (nonatomic, readonly) NSString        *path;
@property (nonatomic, readonly) NSDictionary    *parameters;

- (void)parseData:(NSDictionary *)data;

@end

@implementation AKIFriendDetailContext

@synthesize model = _model;

#pragma mark -
#pragma mark Accessors

- (NSString *)path {
    return [NSString stringWithFormat:@"/%@", self.user.ID];
}

- (NSDictionary *)parameters {
    return @{ @"fields": @"birthday,name,picture{url},hometown",};
}

- (FBSDKGraphRequest *)request {
    return [[FBSDKGraphRequest alloc] initWithGraphPath:self.path
                                             parameters:self.parameters
                                             HTTPMethod:kAKIFBGET];
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
#pragma mark Public

- (void)performExecute {
    FBSDKGraphRequest *request = [self request];
    [request startWithCompletionHandler:[self completionHandler]];
}

#pragma mark -
#pragma mark Private

- (void)parseData:(NSDictionary *)data {
    AKIUser *user = self.user;
    
    NSDictionary *picture = data[@"picture"];
    NSDictionary *data2 = picture[@"data"];
    
    user.url = data2[@"url"];
    
    user.state = AKIModelDidLoad;
}

@end
