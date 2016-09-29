//
//  AKIUsersView.m
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIUsersView.h"

@implementation AKIUsersView

@dynamic editing;

#pragma mark -
#pragma mark Public

- (void)setEditing:(BOOL)editing {
    self.tableView.editing = editing;
}

- (BOOL)isEditing {
    return self.tableView.editing;
}

@end
