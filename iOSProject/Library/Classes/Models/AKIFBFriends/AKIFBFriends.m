//
//  AKIFBFriends.m
//  iOSProject
//
//  Created by Alexey Khomych on 13.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFBFriends.h"

#import "AKIFriendsContext.h"

@implementation AKIFBFriends

#pragma mark -
#pragma mark Public

- (void)performLoading {
    [self.context execute];
    self.state = AKIModelDidLoad;
}

@end
