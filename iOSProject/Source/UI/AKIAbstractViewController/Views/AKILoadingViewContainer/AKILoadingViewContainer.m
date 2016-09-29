//
//  AKILoadingViewContainer.m
//  iOSProject
//
//  Created by Alexey Khomych on 22.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKILoadingViewContainer.h"

#import "AKIGCD.h"

#import "AKIMacro.h"

@implementation AKILoadingViewContainer

#pragma mark -
#pragma mark Public

- (void)setModel:(AKIModel *)model {
    if (_model != model) {
        [_model removeObserver:self];
        
        _model = model;
        
        [_model addObserver:self];
    }
}

#pragma mark -
#pragma mark Observable

- (void)modelWillLoad:(id)model {
    AKIWeakify(self);
    AKIAsyncPerformInMainQueue(^{
        AKIStrongifyAndReturnIfNil(self);
        self.loadingViewVisible = YES;
    });
}

- (void)modelDidLoad:(id)model {
    AKIWeakify(self);
    AKIAsyncPerformInMainQueue(^{
        AKIStrongifyAndReturnIfNil(self);
        self.loadingViewVisible = NO;
    });
}

- (void)modelDidUpdate:(id)model {
    
}

- (void)modelDidFailLoading:(id)model {
    
}

@end
