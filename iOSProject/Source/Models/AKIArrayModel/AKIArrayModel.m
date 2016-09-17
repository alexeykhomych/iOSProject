//
//  AKIArrayModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 21.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayModel.h"

#import "NSMutableArray+AKIExtension.h"

#import "AKIUser.h"

#import "AKIGCD.h"

#import "AKIArrayChangeModel.h"

#import "AKIMacro.h"

@interface AKIArrayModel ()
@property (nonatomic, strong) NSMutableArray    *mutableObjects;

- (void)notifyOfModelUpdateWithChange:(AKIArrayChangeModel *)changeModel;

@end

@implementation AKIArrayModel

#pragma mark -
#pragma mark Init and Dealloc

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObjects = [NSMutableArray new];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)objects {
    @synchronized (self) {
        return [self.mutableObjects copy];
    }
}

- (NSUInteger)count {
    @synchronized (self) {
        return self.mutableObjects.count;
    }
}

#pragma mark -
#pragma mark Public

- (void)addObject:(id)object {
    @synchronized (self) {
        if (object) {
            [self.mutableObjects addObject:object];
            [self notifyOfModelUpdateWithChange:[AKIArrayChangeModel insertModelAtIndex:self.count - 1]];
        }
    }
}

- (void)addObjects:(NSArray *)objects {
    for (id object in objects) {
        [self addObject:object];
    }
}

- (void)removeObject:(id)object {
    @synchronized (self) {
        if (object) {
            [self.mutableObjects removeObject:object];
            [self removeObjectAtIndex:[self.mutableObjects indexOfObject:object]];
        }
    }
}

- (void)removeAllObjects {
    @synchronized (self) {
        [self.mutableObjects removeAllObjects];
    }
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    @synchronized (self) {
        return [self.objects objectAtIndex:index];
    }
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    @synchronized (self) {
        [self.mutableObjects removeObjectAtIndex:index];
        [self notifyOfModelUpdateWithChange:[AKIArrayChangeModel removeModelAtIndex:index]];
    }
}

- (void)moveObjectAtIndex:(NSUInteger)firstIndex toIndex:(NSUInteger)secondIndex {
    @synchronized (self) {
        [self.mutableObjects moveObjectFromIndex:firstIndex toIndex:secondIndex];
        [self notifyOfModelUpdateWithChange:[AKIArrayChangeModel moveModelFromIndex:firstIndex toIndex:secondIndex]];
    }
}

#pragma mark -
#pragma mark Private

- (void)notifyOfModelUpdateWithChange:(AKIArrayChangeModel *)changeModel {
    [self notifyOfState:AKIArrayModelUpdated withObject:changeModel];
}

#pragma mark -
#pragma mark AKIObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case AKIArrayModelUpdated:
            return @selector(arrayModel:didUpdateWithChangeModel:);
            
        case AKIArrayModelFailedLoading:
            return @selector(arrayModelDidFailLoading:);

        case AKIArrayModelDidLoad:
            return @selector(arrayModelDidLoad:);
            
        case AKIArrayModelWillLoad:
            return @selector(arrayModelWillLoad:);
            
        default:
            return nil;
    }
}

@end
