//
//  AKIFilteredArrayModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 14.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFilteredArrayModel.h"

#import "AKIUser.h"

#import "NSArray+AKIExtensions.h"

@interface AKIFilteredArrayModel ()
@property (nonatomic, strong) AKIArrayModel *containerModel;

@end

@implementation AKIFilteredArrayModel

#pragma mark -
#pragma mark Public

- (void)addModelToFilter:(AKIArrayModel *)model {
    if (_containerModel != model) {
        _containerModel = model;
    }
}

- (BOOL)filterUsingString:(NSString *)searchText {
    BOOL result = NO;

    if (!searchText.length) {
        return result;
    }
    
    [self performBlockWithoutNotification:^{
        [self removeAllObjects];
        
        [self addObjects:[self.containerModel.objects filteredArrayUsingBlock:^BOOL(AKIUser *evaluatedObject, NSDictionary * bindings) {
            return [evaluatedObject.fullName containsString:searchText];
        }]];
    }];
    
    return !result;
}

@end
