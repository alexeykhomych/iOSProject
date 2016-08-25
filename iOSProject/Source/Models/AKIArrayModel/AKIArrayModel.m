//
//  AKIArrayModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 21.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayModel.h"

#import "NSString+AKIExtensions.h"

#import "AKIUser.h"

#import "AKIGCD.h"

@interface AKIArrayModel()
@property (nonatomic, retain) NSMutableArray *mutableData;

- (void)randomDataArray:(NSUInteger)count;

@end

@implementation AKIArrayModel

#pragma mark -
#pragma mark Class methods

+ (instancetype)allocWithCount:(NSUInteger)count {
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

- (NSArray *)data {
    return [self.mutableData copy];
}

#pragma mark -
#pragma mark Public

- (void)addObject:(id)object {
    @synchronized (self) {
        [self.mutableData addObject:object];
        [self notifyObserverWithSelector:@selector(array:didUpdate:) object:nil];
    }
}

- (void)removeObject:(id)object {
    @synchronized (self) {
        [self.mutableData removeObject:object];
        [self notifyObserverWithSelector:@selector(array:didUpdate:) object:nil];
    }
}

- (id)objectAtIndexSubscript:(NSUInteger)index {
    return [self.data objectAtIndex:index];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    [self.mutableData removeObjectAtIndex:index];
}

- (void)exchangeObjectAtIndex:(NSUInteger)firstIndex withObjectAtIndex:(NSUInteger)secondIndex {
    [self.mutableData exchangeObjectAtIndex:firstIndex withObjectAtIndex:secondIndex];
}

- (NSUInteger)count {
    return self.data.count;
}

#pragma mark -
#pragma mark Private

- (void)randomDataArray:(NSUInteger)count {
    NSMutableArray *data = [NSMutableArray new];
    
    for (NSUInteger i = 0; i < count; i++) {
        [data addObject:[AKIUser new]];
    }
    
    self.mutableData = data;
}

@end
