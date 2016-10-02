//
//  AKIModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 21.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIModel.h"
#import "AKIGCD.h"

@interface AKIModel ()

- (void)performLoading;
- (BOOL)shouldNotifyObserver:(AKIModelState)state;

@end

@implementation AKIModel

#pragma mark -
#pragma mark Public

- (void)load {
    @synchronized (self) {
        AKIModelState state = self.state;

        if ([self shouldNotifyObserver:state]) {
            [self notifyOfState:state];
            
            return;
        }
        
        self.state = AKIModelWillLoad;
        
        AKIAsyncPerformInBackground(^{
            [self performLoading];
        });
    }
}

- (BOOL)shouldNotifyObserver:(AKIModelState)state {
    return AKIModelDidLoad == state || AKIModelWillLoad == state;
}

- (void)performLoading {
    
}

#pragma mark -
#pragma mark AKIObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case AKIModelUpdated:
            return @selector(modelDidUpdate:);
            
        case AKIModelDidFailLoading:
            return @selector(modelDidFailLoading:);
            
        case AKIModelDidLoad:
            return @selector(modelDidLoad:);
            
        case AKIModelWillLoad:
            return @selector(modelWillLoad:);
            
        default:
            return nil;
    }
}

@end
