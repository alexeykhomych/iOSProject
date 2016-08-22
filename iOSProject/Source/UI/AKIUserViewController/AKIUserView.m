//
//  AKIUserView.m
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIUserView.h"
#import "AKIUserCell.h"

@interface AKIUserView ()

@end

@implementation AKIUserView

#pragma mark -
#pragma mark Public

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [self.tableView setEditing:self.editing animated:animated];
    self.editing = !self.editing;
}

@end
