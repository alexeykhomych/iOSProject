//
//  AKIArrayChangeModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 30.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayChangeModel.h"

@interface AKIArrayChangeModel ()

- (void)addObject;
- (void)removeObject;
- (void)moveObject;

@end

@implementation AKIArrayChangeModel

#pragma mark -
#pragma mark Class methods

+ (id)insertObject:(id)object atIndex:(NSUInteger)index {
    id class = [[self alloc] initWithIndex:index];
    [class addObject];
    
    return class;
}

+ (id)removeObjectAtIndex:(NSUInteger)index {
    id class = [[self alloc] initWithIndex:index];
    [class removeObject];
    
    return class;
}

+ (id)moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    id class = [[self alloc] initWithIndexes:fromIndex toIndex:toIndex];
    [class moveObject];
    
    return class;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithIndex:(NSUInteger)index {
    self = [super init];
    
    if (self) {
        self.fromIndex = index;
    }
    
    return self;
}

- (instancetype)initWithIndexes:(NSUInteger)first toIndex:(NSUInteger)second {
    self = [super init];
    
    if (self) {
        self.fromIndex = first;
        self.toIndex = second;
    }
    
    return self;
}

#pragma mark -
#pragma mark Private

- (void)addObject {
    self.state = AKIArrayChangeModelInsert;
}

- (void)removeObject {
    self.state = AKIArrayChangeModelDelete;
}

- (void)moveObject {
    self.state = AKIArrayChangeModelMove;
}

@end
