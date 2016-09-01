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

@interface AKIArrayModel ()
@property (nonatomic, retain) NSMutableArray *mutableObjects;

- (void)randomDataArray:(NSUInteger)count;
- (void)notifyOfModelUpdateWithChange:(AKIArrayChangeModel *)changeModel;

@end

@implementation AKIArrayModel

#pragma mark -
#pragma mark Class methods

+ (instancetype)arrayWithCount:(NSUInteger)count {
    return [[self alloc] initWithCount:count];
}

#pragma mark -
#pragma mark Init and Dealloc

- (instancetype)initWithCount:(NSUInteger)count {
    self = [super init];
    if (self) {
        [self randomDataArray:count];
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

#pragma mark -
#pragma mark Public

- (void)addObject:(id)object {
    @synchronized (self) {
        [self.mutableObjects addObject:object];
        [self notifyOfModelUpdateWithChange:[AKIArrayChangeModel insertObject:object atIndex:self.count]];
    }
}

- (void)removeObject:(id)object {
    @synchronized (self) {
        [self.mutableObjects removeObject:object];
        [self removeObjectAtIndex:[self.mutableObjects indexOfObject:object]];
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
        [self notifyOfModelUpdateWithChange:[AKIArrayChangeModel removeObjectAtIndex:index]];
    }
}

- (void)moveObjectAtIndex:(NSUInteger)firstIndex toIndex:(NSUInteger)secondIndex {
    @synchronized (self) {
        [self.mutableObjects moveObjectFromIndex:firstIndex toIndex:secondIndex];
        [self notifyOfModelUpdateWithChange:[AKIArrayChangeModel moveObjectFromIndex:firstIndex toIndex:secondIndex]];
    }
}

- (NSUInteger)count {
    @synchronized (self) {
        return self.objects.count;
    }
}

#pragma mark -
#pragma mark Private

- (void)randomDataArray:(NSUInteger)count {
    @synchronized (self) {
        NSMutableArray *objects = [NSMutableArray new];
        
        for (NSUInteger i = 0; i < count; i++) {
            [objects addObject:[AKIUser new]];
        }
        
        self.mutableObjects = objects;
    }
}

- (void)notifyOfModelUpdateWithChange:(AKIArrayChangeModel *)changeModel {
//    [self notifyOfState:changeModel.state withObject:changeModel];
    [self notifyOfState:AKIArrayModelUpdated withObject:changeModel];
}

#pragma mark -
#pragma mark AKIObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case AKIArrayModelLoaded:
            return @selector(arrayModelDidLoad:);
            
        case AKIArrayModelUpdated:
            return @selector(arrayModel: didUpdateWithChangeModel:);
            
        case AKIArrayModelLoading:
            return @selector(arrayModelWillLoad:);
            
        case AKIArrayModelFailedLoading:
            return @selector(arrayModelDidFailLoading:);

        default:
            return nil;
    }
}

@end
