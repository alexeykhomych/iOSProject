//
//  AKIFilteredUsersArrayModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 19.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFilteredUsersArrayModel.h"

#import "AKIUsersArrayModel.h"

#import "AKIUser.h"

@implementation AKIFilteredUsersArrayModel

#pragma mark -
#pragma mark Accessors

- (void)setFilter:(NSString *)filter {
    if (_filter != filter) {
        _filter = filter;
        
        [self filter];
    }
}

#pragma mark -
#pragma mark Public

- (NSPredicate *)predicate {
    return [NSPredicate predicateWithBlock:^BOOL(AKIUser *evaluatedObject, NSDictionary *bindings) {
        if (!self.filter.length) {
            return YES;
        }
        
        return [evaluatedObject.fullName containsString:self.filter];
    }];
}

@end
