//
//  AKIFacebookLoginButton.m
//  iOSProject
//
//  Created by Alexey Khomych on 09.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFacebookLoginButton.h"

#import "AKIGCD.h"

#import "AKIMacro.h"

@implementation AKIFacebookLoginButton

+ (AKIFacebookLoginButton *)viewWithFrame:(CGRect)frame {
    AKIFacebookLoginButton *view = [[self alloc] initWithFrame:frame];
    
    return view;
}

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
