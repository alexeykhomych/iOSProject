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
@class AKIArrayModelChange;

typedef NS_ENUM(NSUInteger, AKIArrayModelState) {
    AKIArrayModelLoaded,
    AKIArrayModelUpdated,
    AKIArrayModelLoading,
    AKIArrayModelFailedLoading
};

@protocol AKIArrayModel <NSObject>

@optional
- (void)arrayModel:(AKIArrayModel *)arrayModel didUpdateWithChangeModel:(AKIArrayModelChange *)arrayModelChange;

- (void)arrayModelDidLoad:(AKIArrayModel *)arrayModel;
- (void)arrayModelDidFailLoading:(AKIArrayModel *)arrayModel;
- (void)arrayModelWillLoad:(AKIArrayModel *)arrayModel;

@end

@interface AKIArrayModel : AKIObservableObject
@property (nonatomic, readonly) NSArray *objects;

+ (instancetype)arrayWithCount:(NSUInteger)count;

- (void)addObject:(id)object;
- (void)removeObject:(id)object;
- (void)removeObjectAtIndex:(NSUInteger)index;

- (void)moveObjectAtIndex:(NSUInteger)firstIndex toIndex:(NSUInteger)secondIndex;

- (id)objectAtIndexedSubscript:(NSUInteger)index;
- (NSUInteger)count;

@end
