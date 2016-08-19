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
//@property (nonatomic, strong) UITableView *editing;
//@property (nonatomic, assign) BOOL editing;

@end

@implementation AKIUserView

#pragma mark -
#pragma mark Public

- (void)editing {
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

@end
