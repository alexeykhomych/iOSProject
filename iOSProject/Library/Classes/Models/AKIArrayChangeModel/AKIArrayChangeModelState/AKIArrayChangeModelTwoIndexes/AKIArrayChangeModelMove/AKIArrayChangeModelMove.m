//
//  AKIArrayChangeModelMove.m
//  iOSProject
//
//  Created by Alexey Khomych on 03.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayChangeModelMove.h"

#import "UITableView+AKIExtensions.h"

@interface AKIArrayChangeModelMove ()
@property (nonatomic, assign) NSUInteger toIndex;
@property (nonatomic, assign) NSUInteger fromIndex;

@end

@implementation AKIArrayChangeModelMove

@synthesize toIndex = _toIndex;
@synthesize fromIndex = _fromIndex;

- (instancetype)initModelFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    self = [super init];
    if (self) {
        self.toIndex = toIndex;
        self.fromIndex = fromIndex;
    }
    
    return self;
}

@end
