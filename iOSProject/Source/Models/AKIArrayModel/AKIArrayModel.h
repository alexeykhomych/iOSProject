//
//  AKIArrayModel.h
//  iOSProject
//
//  Created by Alexey Khomych on 21.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIModel.h"

typedef NS_ENUM(NSUInteger, AKIArrayModelState) {
    AKIArrayModelDidUpdate = AKIModelStateCount
};

@class AKIArrayModel;
@class AKIArrayChangeModel;

@protocol AKIArrayModelObserver <NSObject>

@optional
- (void)arrayModel:(AKIArrayModel *)arrayModel didUpdateWithChangeModel:(AKIArrayChangeModel *)arrayChangeModel;

@end

@interface AKIArrayModel : AKIModel <AKIArrayModelObserver>
@property (nonatomic, readonly) NSArray     *objects;
@property (nonatomic, readonly) NSUInteger  count;

- (void)addObject:(id)object;
- (void)addObjects:(NSArray *)objects;

- (void)exchangeObjects:(NSArray *)objects;

- (void)removeObject:(id)object;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)removeAllObjects;

- (NSUInteger)indexOfObject:(id)object;
- (void)moveObjectAtIndex:(NSUInteger)firstIndex toIndex:(NSUInteger)secondIndex;

- (id)objectAtIndexedSubscript:(NSUInteger)index;

@end
