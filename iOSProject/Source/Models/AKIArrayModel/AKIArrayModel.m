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
@property (nonatomic, retain) NSMutableArray    *mutableObjects;

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

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self)
    {
        self.mutableObjects = [aDecoder decodeObjectForKey:@"kAKIObjects"];
        self.count = [aDecoder decodeIntForKey:@"kAKIObjectsCount"];
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

- (void)removeObject:(id)object {
    @synchronized (self) {
        if (object) {
            [self.mutableObjects removeObject:object];
            [self removeObjectAtIndex:[self.mutableObjects indexOfObject:object]];
        }
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
        case AKIArrayModelLoaded:
            return @selector(arrayModelDidLoad:);
            
        case AKIArrayModelUpdated:
            return @selector(arrayModel:didUpdateWithChangeModel:);
            
        case AKIArrayModelLoading:
            return @selector(arrayModelWillLoad:);
            
        case AKIArrayModelFailedLoading:
            return @selector(arrayModelDidFailLoading:);

        default:
            return nil;
    }
}

#pragma mark -
#pragma mark Serializable

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.objects forKey:@"kAKIObjects"];
    [aCoder encodeInt:(int)self.count forKey:@"kAKIObjectsCount"];
}

@end
