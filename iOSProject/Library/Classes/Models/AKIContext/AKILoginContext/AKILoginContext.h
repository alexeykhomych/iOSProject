//
//  AKILoginContext.h
//  iOSProject
//
//  Created by Alexey Khomych on 10.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIContext.h"

@class AKIFacebookLoginViewController;

@interface AKILoginContext : AKIContext
@property (nonatomic, strong) AKIFacebookLoginViewController *controller;
@property (nonatomic, strong) AKIUser *user;

@end
