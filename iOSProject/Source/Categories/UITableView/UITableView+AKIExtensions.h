//
//  UITableView+AKIExtensions.h
//  iOSProject
//
//  Created by Alexey Khomych on 19.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AKIApplyChangeBlock) (void);

@class AKIArrayChangeModel;

@interface UITableView (AKIExtensions)

- (id)cellWithClass:(Class)class;

- (void)applyChangeModel:(AKIArrayChangeModel *)changeModel;
- (void)applyChangeBlock:(AKIApplyChangeBlock)block;

@end
