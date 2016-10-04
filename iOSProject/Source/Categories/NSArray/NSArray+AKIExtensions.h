//
//  NSArray+AKIExtensions.h
//  iOSProject
//
//  Created by Alexey Khomych on 19.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (AKIExtensions)

- (id)randomObject;
- (id)objectWithClass:(Class)class;

- (NSArray *)filteredArrayUsingBlock:(id)block;

+ (instancetype)objectsWithCount:(NSUInteger)count block:(id(^)())block;

@end
