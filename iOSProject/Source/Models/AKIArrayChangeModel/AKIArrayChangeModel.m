//
//  AKIArrayChangeModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 30.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayChangeModel.h"

@interface AKIArrayChangeModel ()
@property (nonatomic, assign) AKIArrayChangeModelState  state;

@end

@implementation AKIArrayChangeModel

#pragma mark -
#pragma mark Class methods

+ (id)insertModelAtIndex:(NSUInteger)index {
    return [[self alloc] initWithIndex:index];
}

+ (id)removeModelAtIndex:(NSUInteger)index {
    return [[self alloc] initWithIndex:index];
}

+ (id)moveModelFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    return [[self alloc] initWithFromIndex:fromIndex toIndex:toIndex];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithIndex:(NSUInteger)index {
    return [self initWithFromIndex:0 toIndex:index];
}

- (instancetype)initWithFromIndex:(NSUInteger)first toIndex:(NSUInteger)second {
    self = [super init];
    
    if (self) {
        self.fromIndex = first;
        self.toIndex = second;
    }
    
    return self;
}

@end
