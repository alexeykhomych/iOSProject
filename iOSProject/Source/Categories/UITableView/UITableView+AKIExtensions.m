//
//  UITableView+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 19.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "UITableView+AKIExtensions.h"

#import "UINib+AKIExtensions.h"

#import "AKIArrayChangeModel+AKIExtensions.h"	

#import "AKIArrayChangeModel.h"

#import "AKIMacro.h"

@implementation UITableView (AKIExtensions)

- (id)cellWithClass:(Class)class {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(class)];
    if (!cell) {
        cell = [UINib objectWithClass:class];
    }
    
    return cell;
}

- (void)applyChangeModel:(AKIArrayChangeModel *)changeModel {
    [self applyChangeBlock:^{
        [changeModel applyToTableView:self];
    }];
}

- (void)applyChangeBlock:(AKIApplyChangeBlock)block {
    [self beginUpdates];
    AKIPerformBlock(block);
    [self endUpdates];
}

@end
