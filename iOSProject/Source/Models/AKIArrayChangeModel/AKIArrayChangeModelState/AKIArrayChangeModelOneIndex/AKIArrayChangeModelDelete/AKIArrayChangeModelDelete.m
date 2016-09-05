//
//  AKIArrayChangeModelDelete.m
//  iOSProject
//
//  Created by Alexey Khomych on 03.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayChangeModelDelete.h"

#import "UITableView+AKIExtensions.h"

@implementation AKIArrayChangeModelDelete

- (instancetype)initModelWithIndex:(NSUInteger)index {
    self = [super init];
    if (self) {
        self.toIndex = index;
    }
    
    return self;
}

- (void)applyToTableView:(AKIArrayChangeModelOneIndex *)changeModel {
    AKIArrayChangeModelOneIndex *model = changeModel;
    
    //    NSIndexPath *fromIndex = [NSIndexPath indexPathForRow:model.fromIndex inSection:0];
    NSIndexPath *toIndex = [NSIndexPath indexPathForRow:model.toIndex inSection:0];
    
//    [UITableView beginUpdates];
//    [self insertRowsAtIndexPaths:toIndex withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

@end
