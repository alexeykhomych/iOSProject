//
//  NSObject+AKIExtensions.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSObject+AKIExtensions.h"

#import "AKIUser.h"

#import "NSArray+AKIExtensions.h"

@implementation NSObject (AKICategory)

+ (instancetype)object {
    return [[self alloc] init];
}

+ (NSArray *)objectsWithCount:(NSUInteger)count {
    return [NSArray objectsWithCount:count block:^ {
        return [self object];
    }];
}

@end
