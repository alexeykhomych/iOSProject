//
//  AKIArrayModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 21.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayModel.h"

#import "NSString+AKIExtensions.h"

@implementation AKIArrayModel

#pragma mark -
#pragma mark Class methods

+ (instancetype)initWithCount:(NSUInteger)count {
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
#pragma mark Public

- (void)addObject {
    [self.data addObject:[NSString fullName]];
}

- (void)randomDataArray:(NSUInteger)count {
    NSMutableArray *data = [NSMutableArray new];
    
    for (NSUInteger i = 0; i < count; i++) {
        [data addObject:[NSString fullName]];
    }
    
    self.data = data;
    NSLog(@"Done");
}

- (id)objectInDataAtIndex:(NSUInteger)index {
    return [self.data objectAtIndex:index];
}

- (NSUInteger)count {
    return self.data.count;
}


@end
