//
//  AKIView.h
//  iOSProject
//
//  Created by Alexey Khomych on 20.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AKILoadingView;
@class AKILoginButton;

@interface AKIView : UIView
@property (nonatomic, strong) IBOutlet AKILoadingView               *loadingView;
@property (nonatomic, strong) IBOutlet AKILoginButton               *loginButton;
@property (nonatomic, assign, getter=isLoadingViewVisible)  BOOL    loadingViewVisible;
@property (nonatomic, assign, getter=isLoginButtonVisible)  BOOL    loginButtonVisible;

- (AKILoadingView *)defaultLoadingView;
- (AKILoginButton *)defaultLoginButton;

@end
