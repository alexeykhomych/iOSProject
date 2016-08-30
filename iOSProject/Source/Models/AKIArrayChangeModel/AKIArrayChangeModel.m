//
//  AKIArrayChangeModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 30.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayChangeModel.h"

#import "AKIArrayModel.h"

#import "NSMutableArray+AKIExtension.h"

@interface AKIArrayChangeModel ()
@property (nonatomic, retain) NSMutableArray *mutableObjectsModel;

- (void)addObject:(id)object atIndex:(NSUInteger)index;
- (void)deleteObjectAtIndex:(NSUInteger)index;
- (void)moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end

@implementation AKIArrayChangeModel

#pragma mark -
#pragma mark Class methods

+ (id)insertObject:(id)object atIndex:(NSUInteger)index {
    return nil;
}

+ (id)removeObjectAtIndex:(NSUInteger)index {
    return nil;
}

//+ (id)moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
//    return nil;
//}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObjectsModel = [[AKIArrayModel new].data copy];
    }
    
    return self;
}

#pragma mark -
#pragma mark Private

- (void)addObject:(id)object atIndex:(NSUInteger)index {
    [self.mutableObjectsModel insertObject:object atIndex:index];
    
    self.modelState = AKIArrayChangeModelInsert;
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    [self.mutableObjectsModel removeObjectAtIndex:index];
    
    self.modelState = AKIArrayChangeModelDelete;
}

- (void)moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    [self.mutableObjectsModel moveObjectFromIndex:fromIndex toIndex:toIndex];
    self.modelState = AKIArrayChangeModelMove;
}

@end
