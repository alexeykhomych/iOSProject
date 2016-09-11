//
//  AKIFilteredUsersArrayModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 11.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFilteredUsersArrayModel.h"

#import "AKIUser.h"

@implementation AKIFilteredUsersArrayModel

#pragma mark -
#pragma mark Public

- (void)filteredModel:(AKIUsersArrayModel *)model usingString:(NSString *)searchText {
    for (AKIUser *object in model.objects) {
        if ([object.fullName containsString:searchText]) {
            [self addObject:object];
        }
    }
}

@end
