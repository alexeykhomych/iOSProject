//
//  NSObject+AKIExtensions.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSObject+AKIExtensions.h"

@implementation NSObject (AKICategory)

#pragma mark -
#pragma mark Class methods

+ (NSArray *)objectsWithCount:(NSUInteger)count {
    NSMutableArray *objects = [NSMutableArray new];
    
    for (NSUInteger i = 0; i < count; i++) {
        [objects addObject:[self object]];
    }
    
    return objects;
}

+ (instancetype)object {
    return [[self alloc] init];
}

@end
