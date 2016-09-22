//
//  AKIArrayChangeModel+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 06.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayChangeModel+AKIExtensions.h"

#import "AKIArrayChangeModelInsert.h"
#import "AKIArrayChangeModelDelete.h"

#import "AKIArrayChangeModelMove.h"

#import "AKIMacro.h"

#define AKIImplementationClassWithBlock(class, block) \
    @implementation class (UITableView) \
        - (void)applyToTableView:(UITableView *)tableView { \
            [tableView updateWithChangeBlock: \
                block\
            ]; \
    }\
    @end

#define AKIInterfaceWithBlock(class, block) \
    @interface class (UITableView) \
        - (void)applyToTableView:(UITableView *)tableView;\
    @end \
     \
    AKIImplementationClassWithBlock(class, block)

AKIImplementationClassWithBlock(AKIArrayChangeModel, ^{})

AKIInterfaceWithBlock(AKIArrayChangeModelDelete, ^{
    [tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:self.toIndex inSection:0]]
                     withRowAnimation:UITableViewRowAnimationAutomatic];
})

AKIInterfaceWithBlock(AKIArrayChangeModelInsert, ^{
    [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:self.toIndex inSection:0]]
                     withRowAnimation:UITableViewRowAnimationAutomatic];
})

AKIInterfaceWithBlock(AKIArrayChangeModelMove, ^{
    [tableView moveRowAtIndexPath:[NSIndexPath indexPathForItem:self.fromIndex inSection:0]
                      toIndexPath:[NSIndexPath indexPathForItem:self.toIndex inSection:0]];
})
