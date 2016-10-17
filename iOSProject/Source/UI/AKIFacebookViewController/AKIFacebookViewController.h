//
//  AKIFacebookViewController.h
//  iOSProject
//
//  Created by Alexey Khomych on 17.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIAbstractViewController.h"

@class AKIUser;

@interface AKIFacebookViewController : AKIAbstractViewController
@property (nonatomic, strong) AKIUser   *user;
@property (nonatomic, strong) id        context;

// reload on child
- (void)loadContext;

@end
