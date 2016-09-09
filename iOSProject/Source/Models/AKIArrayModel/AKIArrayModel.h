//
//  AKIArrayModel.h
//  iOSProject
//
//  Created by Alexey Khomych on 21.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIObservableObject.h"

@class AKIArrayModel;
@class AKIArrayChangeModel;

typedef NS_ENUM(NSUInteger, AKIArrayModelState) {
    AKIArrayModelLoaded,
    AKIArrayModelUpdated,
    AKIArrayModelLoading,
    AKIArrayModelFailedLoading
};

@protocol AKIArrayModelObserver <NSObject>

@optional
- (void)arrayModel:(AKIArrayModel *)arrayModel didUpdateWithChangeModel:(AKIArrayChangeModel *)arrayChangeModel;

- (void)arrayModelDidLoad:(AKIArrayModel *)arrayModel;
- (void)arrayModelDidFailLoading:(AKIArrayModel *)arrayModel;
- (void)arrayModelWillLoad:(AKIArrayModel *)arrayModel;

- (void)encodeWithCoder:(NSCoder *)aCoder;
- (instancetype)initWithCoder:(NSCoder *)aDecoder;

@end

@interface AKIArrayModel : AKIObservableObject
@property (nonatomic, readonly) NSArray     *objects;
@property (nonatomic, readonly) NSUInteger  count;

- (void)addObject:(id)object;
- (void)removeObject:(id)object;
- (void)removeObjectAtIndex:(NSUInteger)index;

- (void)moveObjectAtIndex:(NSUInteger)firstIndex toIndex:(NSUInteger)secondIndex;

- (id)objectAtIndexedSubscript:(NSUInteger)index;

@end
