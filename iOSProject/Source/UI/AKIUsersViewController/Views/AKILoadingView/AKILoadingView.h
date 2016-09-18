//
//  AKILoadingView.h
//  iOSProject
//
//  Created by Alexey Khomych on 15.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AKILoadingView : UIView
@property (nonatomic, strong)   IBOutlet UIActivityIndicatorView *activityView;

@property (nonatomic, readonly) BOOL visible;



@end
