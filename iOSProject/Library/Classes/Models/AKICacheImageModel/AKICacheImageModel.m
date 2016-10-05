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
    return [self.cache objectForKey:key];
}

- (void)addObject:(id)object forKey:(NSString *)key {
    [self.cache setObject:object forKey:key];
}

- (void)removeObjectForKey:(NSString *)key {
    [self.cache removeObjectForKey:key];
}

- (void)removeAllObjects {
    [self.cache removeAllObjects];
}

@end
