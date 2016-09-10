//
//  UIWindow+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 09.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "UIWindow+AKIExtensions.h"

@implementation UIWindow (AKIExtensions)

#pragma mark -
#pragma mark Class methods

+ (UIWindow *)window {
    return [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
