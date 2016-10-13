//
//  AKIFacebookFriendsCell.m
//  iOSProject
//
//  Created by Alexey Khomych on 09.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFacebookFriendsCell.h"

#import "AKIUser.h"

@implementation AKIFacebookFriendsCell

#pragma mark -
#pragma mark Initializations and deallocations

- (void)dealloc {
    self.user = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(AKIUser *)user {
    if (_user != user) {
        _user = user;
        
        [self fillWithModel:_user];
    }
}

#pragma mark -
#pragma mark Public Implementations

- (void)fillWithModel:(AKIUser *)user {
    self.userName.text = self.user.name;
//    self.userImage.image = user.imageModel;
}

@end
