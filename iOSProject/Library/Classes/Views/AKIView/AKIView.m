//
//  AKIView.m
//  iOSProject
//
//  Created by Alexey Khomych on 20.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIView.h"

#import "AKILoadingView.h"

#import "AKILoginButton.h"

#import "AKIGCD.h"

#import "UINib+AKIExtensions.h"

@implementation AKIView

@dynamic loadingViewVisible;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.loadingView = nil;
    self.loginButton = nil;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.loadingView = [self defaultLoadingView];
    self.loginButton = [self defaultLoginButton];
    
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

- (void)setLoginButton:(AKILoginButton *)loginButton {
    if (_loginButton != loginButton) {
        [_loginButton removeFromSuperview];
        _loginButton = loginButton;
        
        [self addSubview:loginButton];
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

- (void)setLoginButtonVisible:(BOOL)loginButtonVisible {
    self.loginButton.visible = loginButtonVisible;
}

- (BOOL)isLoginButtonVisible {
    @synchronized (self) {
        return self.loginButton.isVisible;
    }
}

#pragma mark -
#pragma mark View Life Cycle

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

- (AKILoginButton *)defaultLoginButton {
    return [AKILoginButton loginButtonInSuperview:self];
}

@end
