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

- (void)fillModelWithCount:(NSUInteger)count {
    @synchronized (self) {
        for (NSUInteger i = 0; i < count; i++) {
            [self addObject:[AKIUser new]];
        }
    }
}

@end
