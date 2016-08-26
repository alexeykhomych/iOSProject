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

typedef NS_ENUM(NSUInteger, AKIArrayModelState) {
    AKIArrayModelLoaded,
    AKIArrayModelUpdated,
    AKIArrayModelLoading,
    AKIArrayModelFailed
};

@protocol AKIArrayModel <NSObject>

@optional
- (void)arrayModel:(AKIArrayModel *)arrayModel didUpdate:(id)data;

- (void)modelLoaded;
- (void)modelUpdated;
- (void)modelFailed;
- (void)modelLoading;

@end

@interface AKIArrayModel : AKIObservableObject
@property (nonatomic, readonly) NSArray *data;

+ (instancetype)arrayWithCount:(NSUInteger)count;

- (void)addObject:(id)object;
- (void)removeObject:(id)object;
- (void)removeObjectAtIndex:(NSUInteger)index;

- (void)moveObjectAtIndex:(NSUInteger)firstIndex toIndex:(NSUInteger)secondIndex;

- (id)objectAtIndexSubscript:(NSUInteger)index;
- (NSUInteger)count;

@end
