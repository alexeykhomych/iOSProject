//
//  NSArray+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 19.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSArray+AKIExtensions.h"

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

@end
