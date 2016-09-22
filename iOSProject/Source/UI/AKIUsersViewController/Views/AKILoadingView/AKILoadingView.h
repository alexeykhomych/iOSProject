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
@property (nonatomic, strong)   IBOutlet UIActivityIndicatorView *activityView;
- (void)setVisible:(BOOL)visible animated:(BOOL)animated;
- (void)    setVisible:(BOOL)visible animated:(BOOL)animated
     completionHandler:(AKICompletionHandler)completionHandler;

@property (nonatomic, readonly, getter=isVisible) BOOL visible;

+ (instancetype)loadingViewInSuperView:(UIView *)superView;

@end
