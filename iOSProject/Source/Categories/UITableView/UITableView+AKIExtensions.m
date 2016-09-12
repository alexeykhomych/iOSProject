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

- (id)cellWithClass:(Class)cls {
    return [self cellWithClass:cls bundle:nil];
}

- (id)cellWithClass:(Class)cls bundle:(NSBundle *)bundle {
    id class = cls;
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(class)];
    
    if (!cell) {
        UINib *nib = [UINib nibWithClass:class bundle:bundle];
        cell = [nib objectWithClass:class];
    }
    
    return cell;
}

- (void)updateWithChangeModel:(AKIArrayChangeModel *)changeModel {
    [self updateWithChangeBlock:^{
        [changeModel applyToTableView:self];
    }];
}

- (void)updateWithChangeBlock:(AKITableViewUpdateBlock)block {
    if (!block) {
        return;
    }
    
    [self beginUpdates];
    AKIPerformBlock(block);
    [self endUpdates];
    
}

@end
