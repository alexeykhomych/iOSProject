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
#pragma mark Public

- (void)filterUsingString:(NSString *)searchText {
    if (!searchText.length) {
        return;
    }
    
    [self setPredicate:[NSPredicate predicateWithBlock:^BOOL(AKIUser *evaluatedObject, NSDictionary *bindings) {
        return [evaluatedObject.fullName containsString:searchText];
    }]];
    
    [self filterUsingPredicate];
}

@end
