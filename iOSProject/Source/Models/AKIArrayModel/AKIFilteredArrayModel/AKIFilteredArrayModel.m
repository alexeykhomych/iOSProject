//
//  AKIFilteredArrayModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 14.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFilteredArrayModel.h"

#import "AKIUser.h"
#import "AKIGCD.h"

#import "NSArray+AKIExtensions.h"

@interface AKIFilteredArrayModel ()
@property (nonatomic, strong) AKIArrayModel *arrayModel;

@end

@implementation AKIFilteredArrayModel

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.arrayModel = nil;
}

- (instancetype)initWithModel:(id)model {
    self = [super init];
    self.arrayModel = model;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setArrayModel:(AKIArrayModel *)arrayModel {
    if (_arrayModel != arrayModel) {
        [_arrayModel removeObserver:self];
        
        _arrayModel = arrayModel;
        
        [_arrayModel addObserver:self];
    }
}

#pragma mark -
#pragma mark Public

- (void)filterObjects {
    AKIAsyncPerformInBackground(^{
        NSArray *objects = [self.arrayModel.objects filteredArrayUsingPredicate:self.predicate];
        [self exchangeObjects:objects];
        
        self.state = AKIModelUpdated;
    });
}

@end
