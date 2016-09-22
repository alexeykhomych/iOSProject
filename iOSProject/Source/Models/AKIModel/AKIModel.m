//
//  AKIModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 21.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIModel.h"

@implementation AKIModel

#pragma mark -
#pragma mark Public

- (void)load {
    @synchronized (self) {
        if (AKIModelWillLoad == self.state) {
            return;
        }
        
        if (AKIModelDidLoad == self.state) {
            [self notifyOfState:AKIModelDidLoad];
            
            return;
        }
        
        self.state = AKIModelDidLoad;
    }
}

#pragma mark -
#pragma mark AKIObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case AKIModelUpdated:
            return @selector(modelDidUpdated);
            
        case AKIModelFailedLoading:
            return @selector(modelFailedLoading);
            
        case AKIModelDidLoad:
            return @selector(modelDidLoad);
            
        case AKIModelWillLoad:
            return @selector(modelWillLoad);
            
        default:
            return nil;
    }
}

@end
