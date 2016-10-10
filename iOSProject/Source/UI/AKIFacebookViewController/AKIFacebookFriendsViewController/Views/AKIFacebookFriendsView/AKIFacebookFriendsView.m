//
//  AKIFacebookFriendsView.m
//  iOSProject
//
//  Created by Alexey Khomych on 10.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFacebookFriendsView.h"

@implementation AKIFacebookFriendsView

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
