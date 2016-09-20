//
//  AKIView.m
//  iOSProject
//
//  Created by Alexey Khomych on 20.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIView.h"

#import "AKILoadingView.h"

@implementation AKIView

@dynamic loadViewVisible;

#pragma mark -
#pragma mark Initializations and deallocations

- (instancetype)init {
    self = [super init];
    self.loadingView = [AKILoadingView loadingViewInSuperView:self];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setLoadingView:(AKILoadingView *)loadingView {
    if (_loadingView != loadingView) {
        _loadingView = loadingView;
    }
}

- (BOOL)isLoadViewVisible {
    return self.loadingView.isVisible;
}

#pragma mark -
#pragma mark Public



@end
