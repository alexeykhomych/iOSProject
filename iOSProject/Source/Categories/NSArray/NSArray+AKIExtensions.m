//
//  NSArray+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 19.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSArray+AKIExtensions.h"

#import "NSObject+AKIExtensions.h"

#import "AKIUser.h"

@implementation NSArray (AKIExtensions)

#pragma mark -
#pragma mark Class methods

- (id)randomObject {
    return [self objectAtIndex:arc4random_uniform((u_int32_t)self.count)];
}

- (id)objectWithClass:(Class)class {
    for (id object in self) {
        if ([object isMemberOfClass:class]) {
            return object;
        }
    }
    
    return nil;
}

- (NSArray *)filteredArrayUsingBlock:(id)block {
    if (!block) {
        return nil;
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithBlock:block];
    
    return [self filteredArrayUsingPredicate:predicate];
}

+ (instancetype)objectsWithCount:(NSUInteger)count block:(id(^)())block {
    if (!block) {
        return nil;
    }
    
    NSMutableArray *objects = [NSMutableArray object];
    
    for (NSUInteger i = 0; i < count; i++) {
        [objects addObject:block()];
    }
    
    return [self arrayWithArray:objects];
}

@end
