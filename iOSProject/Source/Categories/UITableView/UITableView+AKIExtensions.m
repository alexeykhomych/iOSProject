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

@implementation UITableView (AKIExtensions)

- (id)cellWithClass:(Class)class {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(class)];
    if (!cell) {
        cell = [UINib objectWithClass:class];
    }
    
    return cell;
}

- (void)applyToTableView:(AKIArrayChangeModel *)changeModel {
    [self beginUpdates];
    
//    AKIArrayChangeModel *model = changeModel;
//    
//    NSIndexPath *fromIndex = [NSIndexPath indexPathForRow:model.fromIndex inSection:0];
//    NSIndexPath *toIndex = [NSIndexPath indexPathForRow:model.toIndex inSection:0];
//
//    UITableView *tableView = self.userView.tableView;
    //
    //    switch (model.state) {
    //        case AKIArrayChangeModelMove:
    //            [self tableView:tableView moveRowAtIndexPath:fromIndex toIndexPath:toIndex];
    //
    //            break;
    //        case AKIArrayChangeModelDelete:
                [self tableView:tableView commitEditingStyle:UITableViewCellEditingStyleDelete forRowAtIndexPath:toIndex];
    //
    //            break;
    //        case AKIArrayChangeModelInsert:
    //            [self tableView:tableView commitEditingStyle:UITableViewCellEditingStyleInsert forRowAtIndexPath:toIndex];
    //
    //            break;
    //
    //        default:
    //            break;
    //    }
    
    [self endUpdates];
}

@end
