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

#import "AKIArrayChangeModel.h"

@interface AKIArrayModel()
@property (nonatomic, retain) NSMutableArray *mutableData;

- (void)randomDataArray:(NSUInteger)count;

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

- (NSArray *)data {
    @synchronized (self) {
        return [self.mutableData copy];
    }
}

#pragma mark -
#pragma mark Public

- (void)addObject:(id)object {
    @synchronized (self) {
        [AKIArrayChangeModel insertObject:object atIndex:self.count];
//        [self notifyObserverWithSelector:@selector(arrayModel:didUpdate:) object:nil];
    }
}

- (void)removeObject:(id)object {
    @synchronized (self) {
//        [self.mutableData removeObject:object];
        [self removeObjectAtIndex:[self.mutableData indexOfObject:object]];
//        [self notifyObserverWithSelector:@selector(arrayModel:didUpdate:) object:nil];
    }
}

- (id)objectAtIndexSubscript:(NSUInteger)index {
    @synchronized (self) {
        return [self.data objectAtIndex:index];
    }
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    @synchronized (self) {
//        [self.mutableData removeObjectAtIndex:index];
        [AKIArrayChangeModel removeObjectAtIndex:self.count];
    }
}

- (void)moveObjectAtIndex:(NSUInteger)firstIndex toIndex:(NSUInteger)secondIndex {
    @synchronized (self) {
        [AKIArrayChangeModel moveObjectAtIndex:firstIndex toIndex:secondIndex];
    }
}

- (NSUInteger)count {
    @synchronized (self) {
        return self.data.count;
    }
}

#pragma mark -
#pragma mark Private

- (void)randomDataArray:(NSUInteger)count {
    @synchronized (self) {
        NSMutableArray *data = [NSMutableArray new];
        
        for (NSUInteger i = 0; i < count; i++) {
            [data addObject:[AKIUser new]];
        }
        
        self.mutableData = data;
    }
}

#pragma mark -
#pragma mark AKIObservableObject

//- (SEL)selectorForState:(NSUInteger)state {
//    switch (state) {
//        case AKIArrayModelLoaded:
//            return @selector(modelLoaded);
//            break;
//        case AKIArrayModelUpdated:
//            return @selector(modelUpdated);
//            break;
//        case AKIArrayModelLoading:
//            return @selector(modelLoading);
//            break;
//        case AKIArrayModelLoaded:
//            return @selector(modelFailed);
//            break;
//        default:
//            return nil;
//            break;
//    }
//}

@end
