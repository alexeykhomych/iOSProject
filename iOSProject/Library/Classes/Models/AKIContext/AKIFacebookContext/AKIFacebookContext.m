//
//  AKIFacebookContext.m
//  iOSProject
//
//  Created by Alexey Khomych on 13.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFacebookContext.h"

#import "AKIGCD.h"

#import "AKIArrayModel.h"

#import "AKIFBConst.h"

#import "NSFileManager+AKIExtensions.h"

@interface AKIFacebookContext ()
@property (nonatomic, strong)   AKIArrayModel   *model;

@end

@implementation AKIFacebookContext

@synthesize model = _model;

@dynamic path;

#pragma mark -
#pragma mark Accessors

- (NSString *)path {
    return nil;
}

- (id)completionHandler {
    return nil;
}

#pragma mark -
#pragma mark Public

- (void)execute {
    @synchronized (self) {
        AKIModelState state = self.model.state;
        
        if ([self shouldNotifyObserver:state]) {
            [self notifyOfState:state];
            
            return;
        }
        
        self.model.state = AKIModelWillLoad;
        
        AKIAsyncPerformInBackground(^{
            [self performExecute];
        });
    }   
}

- (BOOL)shouldNotifyObserver:(AKIModelState)state {
    return AKIModelDidLoad == state || AKIModelWillLoad == state;
}

- (void)performExecute {
    
}

@end
