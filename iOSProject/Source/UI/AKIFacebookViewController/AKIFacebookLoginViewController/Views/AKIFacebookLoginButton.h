//
//  AKIFacebookLoginButton.h
//  iOSProject
//
//  Created by Alexey Khomych on 09.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AKIView.h"

#import "AKIModel.h"

@interface AKIFacebookLoginButton : AKIView <AKIModelObserver>
@property (nonatomic, strong) IBOutlet UIButton *login;
@property (nonatomic, strong) IBOutlet UIImageView *backgroundImage;

@property (nonatomic, strong) AKIModel *model;

@end
