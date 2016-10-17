//
//  AKIFacebookLoginViewController.h
//  iOSProject
//
//  Created by Alexey Khomych on 09.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIAbstractViewController.h"

#import "AKIFacebookLoginButton.h"

@class AKIUser;

@interface AKIFacebookLoginViewController : AKIAbstractViewController
@property (nonatomic, strong) AKIUser *user;

- (IBAction)onLoginButton:(id)sender;

@end
