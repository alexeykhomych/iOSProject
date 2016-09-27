//
//  AKILoadingView.h
//  iOSProject
//
//  Created by Alexey Khomych on 15.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AKICompletionHandler)(void);

@interface AKILoadingView : UIView
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityView;

@property (nonatomic, assign, getter=isVisible) BOOL visible;
- (void)setVisible:(BOOL)visible animated:(BOOL)animated;
- (void)setVisible:(BOOL)visible animated:(BOOL)animated completionHandler:(AKICompletionHandler)completionHandler;

+ (instancetype)loadingViewInSuperview:(UIView *)superview;

@end
