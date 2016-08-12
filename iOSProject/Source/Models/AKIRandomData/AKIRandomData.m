//
//  AKIRandomData.m
//  iOSProject
//
//  Created by Alexey Khomych on 12.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIRandomData.h"

#import "AKIUser.h"

static NSUInteger const kAKIUserCount = 100;

@interface AKIRandomData()
@property (nonatomic, retain) NSMutableArray *mutableData;

- (id)arrayWithRandomData;

@end

@implementation AKIRandomData

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self removeObserver];
}

- (instancetype)init {
    self = [super init];
    
    self.mutableData = [NSMutableArray new];
    [self addObserver];
    self.mutableData = [self arrayWithRandomData];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)data {
    return [self.mutableData copy];
}

#pragma mark -
#pragma mark Public

- (id)dataFromIndex:(NSUInteger)index {
    return [self.mutableData objectAtIndex:index];
}

- (id)dataFromIndexLiteral:(id)literal {
    return nil;
}

- (NSUInteger)countOfData {
    return [self.data count];
}

#pragma mark -
#pragma mark Private

- (void)addObserver {
    [self.mutableData addObserver:self forKeyPath:@"randomData" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)removeObserver {
    [self.mutableData removeObserver:self forKeyPath:@"randomData"];
}

- (id)arrayWithRandomData {
    NSMutableArray *data = self.mutableData;
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            for (NSUInteger i = 0; i < kAKIUserCount; i++) {
                [data addObject:[AKIUser new]];
            }
        });
    });
    
    return data;
}

@end
