//
//  UITableView+AKIExtensions.h
//  iOSProject
//
//  Created by Alexey Khomych on 19.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AKIArrayChangeModel;

@interface UITableView (AKIExtensions)

- (id)cellWithClass:(Class)class;

- (void)applyToTableView:(AKIArrayChangeModel *)model;

@end
