//
//  NSMutableArray+AKIExtension.m
//  iOSProject
//
//  Created by Alexey Khomych on 30.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSMutableArray+AKIExtension.h"

@implementation NSMutableArray (AKIExtension)

- (id)moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    id object = [self objectAtIndex:fromIndex];
    
    [self removeObjectAtIndex:fromIndex];
    [self insertObject:object atIndex:toIndex];

    return self;
}

@end
