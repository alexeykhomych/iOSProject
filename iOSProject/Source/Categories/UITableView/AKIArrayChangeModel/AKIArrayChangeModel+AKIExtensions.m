//
//  AKIArrayChangeModel+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 06.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayChangeModel+AKIExtensions.h"

#define IDPSynthesizeLockingInterface(class)\
    @interface class (__IDPLockingExtensions__##class) <IDPLocking> \
@end

#define AKIDefaultClass(class, extensions) \
    @implementation class (extensions) \
        - (void)applyToTableView:(UITabeView *)tableView { \
    } \
    @end

#define AKIDefaultImplementation (class, extensions, block) \
    @implementation class (extensions) \
        - (void)applyToTableView:(UITableView *)tableView { \
            [tableView updateWithChangeBlock:^{ \
                block\
            }]; \
        }\
    @end

//AKIDefaultClass(AKIArrayChangeModel, UITableView)
//AKIDefaultImplementation(AKIArrayChangeModelDelete, AKIExtensions, ^{
//    [tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:self.toIndex inSection:0]]
//                     withRowAnimation:UITableViewRowAnimationAutomatic];
//})
@implementation AKIArrayChangeModel (UITableView)

- (void)applyToTableView:(UITableView *)tableView {
    
}

@end

@implementation AKIArrayChangeModelDelete (UITableView)

- (void)applyToTableView:(UITableView *)tableView {
    [tableView updateWithChangeBlock:^{
        [tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:self.toIndex inSection:0]]
                         withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
}

@end

@implementation AKIArrayChangeModelInsert (UITableView)

- (void)applyToTableView:(UITableView *)tableView {
    [tableView updateWithChangeBlock:^{
        [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:self.toIndex inSection:0]]
                         withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
}

@end

@implementation AKIArrayChangeModelMove (UITableView)

- (void)applyToTableView:(UITableView *)tableView {
    [tableView updateWithChangeBlock:^{
        [tableView moveRowAtIndexPath:[NSIndexPath indexPathForItem:self.fromIndex inSection:0]
                          toIndexPath:[NSIndexPath indexPathForItem:self.toIndex inSection:0]];
    }];
}

@end