//
//  AKIView.m
//  iOSProject
//
//  Created by Alexey Khomych on 20.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIView.h"

#import "AKILoadingView.h"

#import "AKIGCD.h"

#import "UINib+AKIExtensions.h"

@implementation AKIView

@dynamic loadingViewVisible;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.loadingView = nil;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.loadingView = [self defaultLoadingView];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    self.loadingView = [self defaultLoadingView];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setLoadingView:(AKILoadingView *)loadingView {
    if (_loadingView != loadingView) {
        [_loadingView removeFromSuperview];
        _loadingView = loadingView;
        
        [self addSubview:loadingView];
    }
}

- (void)setLoadingViewVisible:(BOOL)loadingViewVisible {
    self.loadingView.visible = loadingViewVisible;
}

- (BOOL)isLoadingViewVisible {
    @synchronized (self) {
        return self.loadingView.isVisible;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if (!self.loadingView) {
        self.loadingView = [self defaultLoadingView];
    }
}

#pragma mark -
#pragma mark Public

- (AKILoadingView *)defaultLoadingView {
    return [AKILoadingView loadingViewInSuperview:self];
}

@end
