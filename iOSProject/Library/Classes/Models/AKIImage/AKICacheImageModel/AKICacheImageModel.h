//
//  AKICacheImageModel.h
//  iOSProject
//
//  Created by Alexey Khomych on 05.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKICacheImageModel : NSObject
@property (nonatomic, readonly) NSCache *cache;

+ (instancetype)cache;

- (void)addObject:(id)object forKey:(NSString *)key;
- (void)removeObjectForKey:(NSString *)key;
- (void)removeAllObjects;

- (id)objectForKey:(NSString *)key;

@end
