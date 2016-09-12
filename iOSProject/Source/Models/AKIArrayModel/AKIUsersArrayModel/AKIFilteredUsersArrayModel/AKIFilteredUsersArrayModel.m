//
//  AKIFilteredUsersArrayModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 11.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFilteredUsersArrayModel.h"

#import "AKIUser.h"

#import "NSArray+AKIExtensions.h"

@implementation AKIFilteredUsersArrayModel

#pragma mark -
#pragma mark Public

- (void)filteredModel:(AKIUsersArrayModel *)model usingString:(NSString *)searchText {
    [self addObjects:[model.objects filteredArrayUsingBlock:^BOOL(AKIUser *evaluatedObject, NSDictionary * bindings) {
        return [evaluatedObject.fullName containsString:searchText];
    }]];
}

@end
