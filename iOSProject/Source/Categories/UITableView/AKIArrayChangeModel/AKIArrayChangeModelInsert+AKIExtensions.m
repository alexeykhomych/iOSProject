//
//  AKIArrayChangeModelInsert+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 06.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayChangeModelInsert+AKIExtensions.h"

#import "UITableView+AKIExtensions.h"

@implementation AKIArrayChangeModelInsert (AKIExtensions)

- (void)applyToTableView:(UITableView *)tableView {
    [tableView applyChangeBlock:^{
        [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:self.toIndex inSection:0]]
                         withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
}

@end
