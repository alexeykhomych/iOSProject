//
//  AKILoadingView.m
//  iOSProject
//
//  Created by Alexey Khomych on 15.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKILoadingView.h"

#import "NSBundle+AKIExtensions.h"

@implementation AKILoadingView

#pragma mark -
#pragma mark Class methods

+ (instancetype)attachView {
    AKILoadingView *view = [NSBundle objectWithClass:[AKILoadingView class]];
    
    return view;
}

#pragma mark -
#pragma mark Public

- (void)setVisible:(BOOL)visible {
    self.activityView.alpha = visible;
}

@end
