//
//  AKIArrayChangeModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 30.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayChangeModel.h"

#import "AKIArrayChangeModelInsert.h"
#import "AKIArrayChangeModelDelete.h"
#import "AKIArrayChangeModelMove.h"

@implementation AKIArrayChangeModel

#pragma mark -
#pragma mark Class methods

+ (id)insertModelAtIndex:(NSUInteger)index {
    return [AKIArrayChangeModelInsert new];
}

+ (id)removeModelAtIndex:(NSUInteger)index {
    return [AKIArrayChangeModelDelete new];
}

+ (id)moveModelFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    return [AKIArrayChangeModelMove new];
}

@end
