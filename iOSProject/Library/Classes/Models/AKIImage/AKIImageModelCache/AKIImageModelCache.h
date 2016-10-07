//
//  AKIImageModelCache.h
//  iOSProject
//
//  Created by Alexey Khomych on 05.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AKIImageModel;

@interface AKIImageModelCache : NSObject

+ (instancetype)cache;

- (void)addObject:(AKIImageModel *)model;
- (void)removeObject:(AKIImageModel *)model;

- (id)objectForKey:(NSURL *)key;

@end
