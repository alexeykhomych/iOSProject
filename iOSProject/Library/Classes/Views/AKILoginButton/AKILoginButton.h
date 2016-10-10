//
//  AKILoginButton.h
//  iOSProject
//
//  Created by Alexey Khomych on 10.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AKICompletionHandler)(void);

@interface AKILoginButton : UIView
@property (nonatomic, strong) IBOutlet UIButton *loginButton;
@property (nonatomic, assign, getter=isVisible) BOOL visible;

+ (instancetype)loginButtonInSuperview:(UIView *)superview;



@end
