//
//  AKIArrayModel.h
//  iOSProject
//
//  Created by Alexey Khomych on 21.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
    - доступ по индексам;
	- доступ по литералу индекса;
	- работа как с моделями, так и с индексами моделей;
	- возможность получить количество;
 */

@interface AKIArrayModel : NSObject
@property (nonatomic, retain) NSMutableArray *data;

+ (instancetype)initWithCount:(NSUInteger)count;

- (void)randomDataArray:(NSUInteger)count;

- (void)addObject;
- (id)objectInDataAtIndex:(NSUInteger)index;
- (NSUInteger)count;

@end
