//
//  AKIArrayChangeModel+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 06.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayChangeModel+AKIExtensions.h"

@implementation AKIArrayChangeModel (AKIExtensions)

- (void)applyToTableView:(UITableView *)tableView {
    
}

@end

@implementation AKIArrayChangeModelDelete (AKIExtensions)

- (void)applyToTableView:(UITableView *)tableView {
    [tableView applyChangeBlock:^{
        [tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:self.toIndex inSection:0]]
                         withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
}

@end

@implementation AKIArrayChangeModelInsert (AKIExtensions)

- (void)applyToTableView:(UITableView *)tableView {
    [tableView applyChangeBlock:^{
        [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:self.toIndex inSection:0]]
                         withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
}

@end

@implementation AKIArrayChangeModelMove (AKIExtensions)

- (void)applyToTableView:(UITableView *)tableView {
    [tableView applyChangeBlock:^{
        [tableView moveRowAtIndexPath:[NSIndexPath indexPathForItem:self.fromIndex inSection:0]
                          toIndexPath:[NSIndexPath indexPathForItem:self.toIndex inSection:0]];
    }];
}

@end