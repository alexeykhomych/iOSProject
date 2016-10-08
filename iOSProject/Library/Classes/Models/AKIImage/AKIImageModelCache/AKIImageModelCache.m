//
//  AKIImageModelCache.m
//  iOSProject
//
//  Created by Alexey Khomych on 05.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIImageModelCache.h"

#import "AKIImageModel.h"

@interface AKIImageModelCache ()
@property (nonatomic, strong) NSMapTable *mapTable;

@end

@implementation AKIImageModelCache

#pragma mark -
#pragma mark Class methods

+ (instancetype)cache {
    static dispatch_once_t onceToken;
    static AKIImageModelCache *cacheImageModel = nil;
    dispatch_once(&onceToken, ^{
        cacheImageModel = [[AKIImageModelCache alloc] init];
    });
    
    return cacheImageModel;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mapTable = nil;
}

- (instancetype)init {
    self = [super init];
    self.mapTable = [NSMapTable strongToWeakObjectsMapTable];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (id)objectForKey:(NSURL *)key {
    @synchronized (self) {
        return [self.mapTable objectForKey:key];
    }
}

- (void)addObject:(AKIImageModel *)model {
    @synchronized (self) {
        [self.mapTable setObject:model forKey:model.url];
    }
}

- (void)removeObject:(AKIImageModel *)model {
    @synchronized (self) {
        [self.mapTable removeObjectForKey:model.url];
    }
}

@end
