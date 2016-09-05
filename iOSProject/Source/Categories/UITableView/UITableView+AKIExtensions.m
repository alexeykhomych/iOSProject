//
//  UITableView+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 19.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "UITableView+AKIExtensions.h"

#import "UINib+AKIExtensions.h"

#import "AKIArrayChangeModel.h"

#import "AKIArrayChangeModelOneIndex.h"
#import "AKIArrayChangeModelTwoIndexes.h"

@implementation UITableView (AKIExtensions)

- (id)cellWithClass:(Class)class {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(class)];
    if (!cell) {
        cell = [UINib objectWithClass:class];
    }
    
    return cell;
}

- (void)applyToTableView:(AKIArrayChangeModelOneIndex *)changeModel {
    AKIArrayChangeModelOneIndex *model = changeModel;

//    NSIndexPath *fromIndex = [NSIndexPath indexPathForRow:model.fromIndex inSection:0];
    NSIndexPath *toIndex = [NSIndexPath indexPathForRow:model.toIndex inSection:0];
    
    [self beginUpdates];
    [self insertRowsAtIndexPaths:toIndex withRowAnimation:UITableViewRowAnimationAutomatic];
    [self endUpdates];
}

@end
