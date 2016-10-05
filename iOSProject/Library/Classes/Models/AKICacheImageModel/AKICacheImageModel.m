//
//  AKICacheImageModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 05.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKICacheImageModel.h"

@interface AKICacheImageModel ()
@property (nonatomic, strong) NSCache *cache;

@end

@implementation AKICacheImageModel

#pragma mark -
#pragma mark Class methods

+ (instancetype)cache {
    static dispatch_once_t onceToken;
    static AKICacheImageModel *cacheImageModel = nil;
    dispatch_once(&onceToken, ^{
        cacheImageModel = [[AKICacheImageModel alloc] init];
    });
    
    return cacheImageModel;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.cache = nil;
}

- (instancetype)init {
    self = [super init];
    self.cache = [[NSCache alloc] init];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (id)objectForKey:(NSString *)key {
    @synchronized (self) {
        return [self.cache objectForKey:key];
    }
}

- (void)addObject:(id)object forKey:(NSString *)key {
    @synchronized (self) {
        [self.cache setObject:object forKey:key];
    }
}

- (void)removeObjectForKey:(NSString *)key {
    @synchronized (self) {
        [self.cache removeObjectForKey:key];
    }
}

- (void)removeAllObjects {
    @synchronized (self) {
        [self.cache removeAllObjects];
    }
}

@end
