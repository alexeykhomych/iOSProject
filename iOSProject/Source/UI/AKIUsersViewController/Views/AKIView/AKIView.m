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

@interface AKIView ()

- (void)initSubviews;

@end

@implementation AKIView

@dynamic loadingViewVisible;

#pragma mark -
#pragma mark Initializations and deallocations

- (instancetype)init {
    return [super init];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self initSubviews];
    
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
    [self.loadingView setVisible:loadingViewVisible];
}

- (BOOL)isLoadingViewVisible {
    return self.loadingView.isVisible;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    self.imageView.frame = self.bounds;
}

#pragma mark -
#pragma mark Public

#pragma mark -
#pragma mark Private

- (void)initSubviews {
    id loadingView = [AKILoadingView loadingViewInSuperView:self];
    self.loadingView = loadingView;
    [self addSubview:loadingView];
    
    [self setNeedsLayout];
}


@end
