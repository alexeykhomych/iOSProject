//
//  AKIImageModelCache.h
//  iOSProject
//
//  Created by Alexey Khomych on 05.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKIImageModelCache : NSObject

+ (instancetype)cache;

- (void)setObject:(id)object forKey:(NSURL *)key;
- (void)removeObjectForKey:(NSURL *)key;

- (id)objectForKey:(NSURL *)key;

@end
