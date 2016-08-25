//
//  AKIArrayModel.h
//  iOSProject
//
//  Created by Alexey Khomych on 21.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIObservableObject.h"

/*
    - доступ по индексам;
	- доступ по литералу индекса;
	- работа как с моделями, так и с индексами моделей;
	- возможность получить количество;
 */

@protocol AKIArrayModel <NSObject>

@optional
- (void)array:(NSArray *)array didUpdate:(id)data;

@end

@interface AKIArrayModel : AKIObservableObject
@property (nonatomic, readonly) NSArray *data;

+ (instancetype)allocWithCount:(NSUInteger)count;

- (void)addObject:(id)object;
- (void)removeObject:(id)object;
- (void)removeObjectAtIndex:(NSUInteger)index;

- (void)exchangeObjectAtIndex:(NSUInteger)firstIndex withObjectAtIndex:(NSUInteger)secondIndex;

- (id)objectAtIndexSubscript:(NSUInteger)index;
- (NSUInteger)count;

@end
