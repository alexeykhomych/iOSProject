//
//  AKIUsersArrayModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 02.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIUsersArrayModel.h"

#import "AKIUser.h"

@interface AKIUsersArrayModel ()
@property (nonatomic, retain) NSMutableArray    *mutableObjects;

@end

@implementation AKIUsersArrayModel

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithCount:(NSUInteger)count {
    self = [super init];
    if (self) {
        self.mutableObjects = [NSMutableArray new];
        [self fillModelWithCount:count];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors 

- (NSArray *)objects {
    return [self.mutableObjects copy];
}

#pragma mark -
#pragma mark Public

- (void)save {
    
}

- (void)load {
    
}

- (void)fillModelWithCount:(NSUInteger)count {
    @synchronized (self) {
        NSMutableArray *objects = [NSMutableArray new];
        
        for (NSUInteger i = 0; i < count; i++) {
            [objects addObject:[AKIUser new]];
        }
        
        self.mutableObjects = [objects copy];
    }
}

@end
