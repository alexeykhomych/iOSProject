//
//  AKIFilteredArrayModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 14.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFilteredArrayModel.h"

#import "NSArray+AKIExtensions.h"

#import "AKIUser.h"

@interface AKIFilteredArrayModel ()
@property (nonatomic, strong) AKIArrayModel *containerModel;
@property (nonatomic, strong) NSPredicate   *predicate;

@end

@implementation AKIFilteredArrayModel

#pragma mark -
#pragma mark Accessors

- (void)setPredicate:(NSPredicate *)predicate {
    if (_predicate != predicate) {
        _predicate = predicate;
    }
}

- (void)addModelToFilter:(AKIArrayModel *)model {
    if (_containerModel != model) {
        _containerModel = model;
        [self addObjects:model.objects];
    }
}

#pragma mark -
#pragma mark Public

- (void)filterUsingPredicate {
    [self performBlockWithoutNotification:^{
//        [self removeAllObjects];
//    
//        if (!self.predicate) {
//            [self addObjects:self.containerModel.objects];
//            
//            return;
//        }
//        
        //[self addObjects:[self.containerModel.objects filteredArrayUsingPredicate:self.predicate]];
        
        [self.containerModel removeAllObjects];
        
        if (!self.predicate) {
            [self.containerModel addObjects:self.objects];
            
            return;
        }
        
        [self.containerModel addObjects:[self.objects filteredArrayUsingPredicate:self.predicate]];
    }];
    
//    self.state = AKIArrayModelUpdated;
}

@end
