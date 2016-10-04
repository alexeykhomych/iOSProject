//
//  AKIView.h
//  iOSProject
//
//  Created by Alexey Khomych on 20.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AKILoadingView;

@interface AKIView : UIView
@property (nonatomic, strong) IBOutlet AKILoadingView  *loadingView;
@property (nonatomic, assign, getter=isLoadingViewVisible)  BOOL loadingViewVisible;

- (AKILoadingView *)defaultLoadingView;

@end
