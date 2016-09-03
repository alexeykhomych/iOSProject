//
//  UIViewController+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 01.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "UIViewController+AKIExtensions.h"

@implementation UIViewController (AKIExtensions)

+ (instancetype)viewController {
    return [[self alloc] initWithNibName:[self nibName] bundle:nil];
}

+ (NSString *)nibName {
    return NSStringFromClass([self class]);
}

- (void)applyToTableView:(UITableView *)tableView {
    
}

@end
