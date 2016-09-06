//
//  AKIArrayChangeModelDelete+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 06.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayChangeModelDelete+AKIExtensions.h"

#import "UITableView+AKIExtensions.h"

@implementation AKIArrayChangeModelDelete (AKIExtensions)

- (void)applyToTableView:(UITableView *)tableView {
    [tableView applyChangeBlock:^{
        [tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:self.toIndex inSection:0]]
                         withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
}

@end
