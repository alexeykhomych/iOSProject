//
//  AKILoginContext.h
//  iOSProject
//
//  Created by Alexey Khomych on 10.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AKIFacebookContext.h"

@interface AKILoginContext : AKIFacebookContext
@property (nonatomic, strong) UIViewController  *controller;

@end
