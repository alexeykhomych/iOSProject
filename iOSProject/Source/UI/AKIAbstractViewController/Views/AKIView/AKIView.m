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

@interface AKIView ()

- (void)initSubviews;

@end

@implementation AKIView

@dynamic loadingViewVisible;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.loadingView = nil;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self initSubviews];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
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
        [self initSubviews];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)layoutSubviews {
    [super layoutSubviews];
}

#pragma mark -
#pragma mark Public

- (void)initLoadingView {
    AKILoadingView *loadingView = [AKILoadingView loadingViewInSuperview:self];
    loadingView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin
                                    |UIViewAutoresizingFlexibleRightMargin
                                    |UIViewAutoresizingFlexibleBottomMargin;
    
    self.loadingView = loadingView;
}

#pragma mark -
#pragma mark Private

- (void)initSubviews {
    [self initLoadingView];
    [self setNeedsLayout];
}

@end
