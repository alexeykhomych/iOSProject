//
//  NSBundle+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 10.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSBundle+AKIExtensions.h"

#import "NSArray+AKIExtensions.h"

@implementation NSBundle (AKIExtensions)

+ (id)objectWithClass:(id)class {
    return [self objectWithClass:class owner:nil];
}

+ (id)objectWithClass:(id)class owner:(id)owner {
    return [self objectWithClass:class owner:owner options:nil];
}

+ (id)objectWithClass:(id)class owner:(id)owner options:(NSDictionary *)options {
    NSArray *objects = [[self mainBundle] loadNibNamed:NSStringFromClass([class class]) owner:owner options:options];
    
    return [objects objectWithClass:class];
}

- (id)objectWithClass:(Class)class {
    return [self objectWithClass:class owner:nil];
}

- (id)objectWithClass:(Class)class owner:(id)owner {
    return [self objectWithClass:class owner:owner options:nil];
}

- (id)objectWithClass:(Class)class owner:(id)owner options:(NSDictionary *)options {
    return [[self loadNibNamed:NSStringFromClass([class class]) owner:owner options:options] objectWithClass:class];
}

@end
