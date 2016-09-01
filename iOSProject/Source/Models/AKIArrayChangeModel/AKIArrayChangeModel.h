//
//  AKIArrayChangeModel.h
//  iOSProject
//
//  Created by Alexey Khomych on 30.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSUInteger, AKIArrayChangeModelState) {
    AKIArrayChangeModelInsert,
    AKIArrayChangeModelDelete,
    AKIArrayChangeModelMove
};

@interface AKIArrayChangeModel : NSObject
@property (nonatomic, assign) AKIArrayChangeModelState  state;

@property (nonatomic, assign) NSUInteger    fromIndex;
@property (nonatomic, assign) NSUInteger    toIndex;

+ (id)insertObject:(id)object atIndex:(NSUInteger)index;
+ (id)removeObjectAtIndex:(NSUInteger)index;
+ (id)moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
