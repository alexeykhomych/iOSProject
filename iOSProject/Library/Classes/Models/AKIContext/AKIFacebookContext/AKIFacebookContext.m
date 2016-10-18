//
//  AKIFacebookContext.m
//  iOSProject
//
//  Created by Alexey Khomych on 13.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFacebookContext.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "AKIFBConst.h"

#import "AKIGCD.h"

#import "AKIArrayModel.h"

#import "NSFileManager+AKIExtensions.h"

@implementation AKIFacebookContext

#pragma mark -
#pragma mark Accessors

- (NSString *)path {
    return nil;
}

- (id)completionHandler {
    return nil;
}

- (NSString *)parameters {
    return nil;
}

- (NSString *)requestType {
    return kAKIFBGET;
}

- (FBSDKGraphRequest *)request {
    return [[FBSDKGraphRequest alloc] initWithGraphPath:self.path
                                             parameters:self.parameters
                                             HTTPMethod:self.requestType];
}

#pragma mark -
#pragma mark Public

- (void)execute {
    @synchronized (self) {
        AKIArrayModel *model = self.model;
        AKIModelState state = model.state;
        
        if ([self shouldNotifyObserver:state]) {
            [self notifyOfState:state];
            
            return;
        }
        
        model.state = AKIModelWillLoad;
        
        AKIAsyncPerformInBackground(^{
            [self performExecute];
        });
    }   
}

- (void)performExecute {
    AKIWeakify(self);
    AKIAsyncPerformInMainQueue(^{
        AKIStrongifyAndReturnIfNil(self);
        [[self request] startWithCompletionHandler:[self completionHandler]];
    });
}

- (BOOL)shouldNotifyObserver:(AKIModelState)state {
    return AKIModelDidLoad == state || AKIModelWillLoad == state;
}

@end
