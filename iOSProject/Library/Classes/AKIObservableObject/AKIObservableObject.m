//
//  AKIObservableObject.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 01.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIObservableObject.h"

#import "AKIMacro.h"

@interface AKIObservableObject()
@property (nonatomic, strong) NSHashTable   *observersTable;

@property (nonatomic, assign) BOOL          notifyObservers;

- (void)performBlock:(void (^)(void))block shouldNotify:(BOOL)notify;

@end

@implementation AKIObservableObject

@synthesize state = _state;

@dynamic observers;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    self.observersTable = [NSHashTable weakObjectsHashTable];
    self.notifyObservers = YES;
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (NSSet *)observers {
    @synchronized (self) {
        return self.observersTable.setRepresentation;
    }
}

- (void)setState:(NSUInteger)state {
    [self setState:state withObject:self];
}

- (void)setState:(NSUInteger)state withObject:(id)object {
    @synchronized (self) {
        if (_state != state) {
            _state = state;
            
            [self notifyOfState:state withObject:object];
        }
    }
}

#pragma mark -
#pragma mark Public Methods

- (SEL)selectorForState:(NSUInteger)state {
    return NULL;
}

- (void)addObserver:(id)object {
    @synchronized (self) {
        if (object) {
            [self.observersTable addObject:object];
        }
    }
}

- (void)addObservers:(NSArray *)observers {
    @synchronized (self) {
        for (id observer in observers) {
            [self addObserver:observer];
        }
    }
}

- (void)removeObserver:(id)object {
    @synchronized (self) {
        [self.observersTable removeObject:object];
    }
}

- (void)removeObservers:(NSArray *)observers {
    @synchronized (self) {
        for (id object in observers) {
            [self removeObserver:object];
        }
    }
}

- (BOOL)containsObserver:(id)object {
    @synchronized (self) {
        return [self.observersTable containsObject:object];
    }
}

- (void)notifyOfState:(NSUInteger)state {
    [self notifyOfState:state withObject:nil];
}

- (void)notifyOfState:(NSUInteger)state withObject:(id)object {
    [self notifyObserverWithSelector:[self selectorForState:state] object:object];
}

- (void)performBlockWithoutNotification:(void (^)(void))block {
    [self performBlock:block shouldNotify:NO];
}

- (void)performBlockWithNotification:(void (^)(void))block {
    [self performBlock:block shouldNotify:YES];
}

- (void)performBlock:(void (^)(void))block shouldNotify:(BOOL)notify {
    @synchronized (self) {
        if (!block) {
            return;
        }
        
        BOOL currentNotifyObservers = self.notifyObservers;
        
        self.notifyObservers = notify;
        AKIPerformBlock(block);
        self.notifyObservers = currentNotifyObservers;
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)notifyObserverWithSelector:(SEL)selector {
    [self notifyObserverWithSelector:selector object:nil];
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

- (void)notifyObserverWithSelector:(SEL)selector object:(id)object {
    @synchronized (self) {
        if (!self.notifyObservers) {
            return;
        }
        
        NSHashTable *observers = self.observersTable;
    
        for (id observer in observers) {
            if ([observer respondsToSelector:selector]) {
                [observer performSelector:selector withObject:self withObject:object];
            }
        }
    }
}

@end
