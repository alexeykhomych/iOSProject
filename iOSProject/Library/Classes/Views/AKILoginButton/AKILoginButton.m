//
//  AKILoginButton.m
//  iOSProject
//
//  Created by Alexey Khomych on 10.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKILoginButton.h"

#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "NSBundle+AKIExtensions.h"

#import "AKIMacro.h"

AKIConstant(float, Duration, 1.0);

@implementation AKILoginButton

#pragma mark -
#pragma mark Class methods

+ (instancetype)loginButtonInSuperview:(UIView *)superview {
    AKILoginButton *view = [NSBundle objectWithClass:[AKILoginButton class]];
    view.frame = superview.bounds;
    
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth
    | UIViewAutoresizingFlexibleHeight;
    
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
    AKIWeakify(self);
    [self setVisible:visible animated:animated completionHandler:^{
        if (!visible) {
            AKIStrongify(self);
            [self removeFromSuperview];
        }
    }];
}

- (void)setVisible:(BOOL)visible
          animated:(BOOL)animated
 completionHandler:(AKICompletionHandler)completionHandler
{
    [self.superview bringSubviewToFront:self];
    [UIView animateWithDuration:animated ? kAKIDuration : 0
                     animations:^{
                         self.alpha = visible ? 1.0 : 0;
                     }
                     completion:^(BOOL shouldFinish) {
                         _visible = visible;
                         
                         if (completionHandler) {
                             completionHandler();
                         }
                     }];
}

@end
