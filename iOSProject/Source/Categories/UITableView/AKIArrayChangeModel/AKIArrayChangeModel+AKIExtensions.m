//
//  AKIArrayChangeModel+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 06.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayChangeModel+AKIExtensions.h"

#define AKIImplementationWithEmptyMethod(class, extensions) \
    @implementation class (extensions) \
        - (void)applyToTableView:(id)tableView{}\
    @end

#define AKIImplementationClassWithBlock(class, extensions, block) \
    @implementation class (extensions) \
        - (void)applyToTableView:(UITableView *)tableView { \
            [tableView updateWithChangeBlock: \
                block\
            ]; \
        }\
    @end

AKIImplementationWithEmptyMethod(AKIArrayChangeModel, UITableView)

AKIImplementationClassWithBlock(AKIArrayChangeModelDelete, UITableView, ^{
    [tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:self.toIndex inSection:0]]
                     withRowAnimation:UITableViewRowAnimationAutomatic];
})

AKIImplementationClassWithBlock(AKIArrayChangeModelInsert, UITableView, ^{
    [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:self.toIndex inSection:0]]
                             withRowAnimation:UITableViewRowAnimationAutomatic];
})

AKIImplementationClassWithBlock(AKIArrayChangeModelMove, UITableView, ^{
    [tableView moveRowAtIndexPath:[NSIndexPath indexPathForItem:self.fromIndex inSection:0]
                      toIndexPath:[NSIndexPath indexPathForItem:self.toIndex inSection:0]];
})
