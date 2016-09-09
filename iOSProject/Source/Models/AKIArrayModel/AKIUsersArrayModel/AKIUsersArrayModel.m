//
//  AKIUsersArrayModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 02.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIUsersArrayModel.h"

#import "AKIUser.h"

#import "AKIMacro.h"

#import "AKIGCD.h"

AKIConstant(NSUInteger, UsersCount, 10);

@implementation AKIUsersArrayModel

#pragma mark -
#pragma mark Public

- (void)save {
    @synchronized (self) {
        
    }
}

- (void)load {
    @synchronized (self) {

    }
}

- (void)fillModel {
    [self performBlockWithNotification:^{
        for (NSUInteger i = 0; i < kAKIUsersCount; i++) {
            [self addObject:[AKIUser new]];
        }
    }];
}

@end
