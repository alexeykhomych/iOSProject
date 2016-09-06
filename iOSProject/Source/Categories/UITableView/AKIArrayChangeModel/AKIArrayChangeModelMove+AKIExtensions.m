//
//  AKIArrayChangeModelMove+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 06.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayChangeModelMove+AKIExtensions.h"

#import "UITableView+AKIExtensions.h"

@implementation AKIArrayChangeModelMove (AKIExtensions)

- (void)applyToTableView:(UITableView *)tableView {
    [tableView applyChangeBlock:^{
        [tableView moveRowAtIndexPath:[NSIndexPath indexPathForItem:self.fromIndex inSection:0]
                          toIndexPath:[NSIndexPath indexPathForItem:self.toIndex inSection:0]];
    }];
}

@end
