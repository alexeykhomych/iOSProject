//
//  AKILoadingView.m
//  iOSProject
//
//  Created by Alexey Khomych on 15.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKILoadingView.h"

#import "NSBundle+AKIExtensions.h"

#import "AKIMacro.h"

AKIConstant(float, Duration, 1.0);

@implementation AKILoadingView

#pragma mark -
#pragma mark Class methods

+ (instancetype)loadingViewInSuperView:(UIView *)superView {
    AKILoadingView *view = [NSBundle objectWithClass:[AKILoadingView class]];
    view.frame = superView.bounds;
    
    return view;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithFrame:(CGRect)frame {
    return [super initWithFrame:frame];
}

#pragma mark -
#pragma mark Public

- (void)setVisible:(BOOL)visible {
    [self setVisible:visible animated:YES];
}

- (void)setVisible:(BOOL)visible animated:(BOOL)animated {
    [self setVisible:visible animated:animated completionHandler:nil];
}

- (void)    setVisible:(BOOL)visible animated:(BOOL)animated
     completionHandler:(AKICompletionHandler)completionHandler
{
    if (_visible == visible) {
        return;
    }
    
    [self.superview bringSubviewToFront:self];
    
    [UIView animateWithDuration:animated ? kAKIDuration : 0
                     animations:^{
                         self.activityView.alpha = visible ? 1.0 : 0;
                     }
                     completion:^(BOOL shouldFinish) {
                         _visible = visible;
                         if (completionHandler) {
                             completionHandler();
                         }
                     }];
}

@end
