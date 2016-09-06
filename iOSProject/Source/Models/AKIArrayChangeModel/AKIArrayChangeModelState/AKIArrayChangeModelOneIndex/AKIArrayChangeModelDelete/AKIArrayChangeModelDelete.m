//
//  AKIArrayChangeModelDelete.m
//  iOSProject
//
//  Created by Alexey Khomych on 03.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayChangeModelDelete.h"

#import "UITableView+AKIExtensions.h"

@interface AKIArrayChangeModelDelete ()
@property (nonatomic, assign) NSUInteger toIndex;

@end

@implementation AKIArrayChangeModelDelete

@synthesize toIndex = _toIndex;

- (instancetype)initModelWithIndex:(NSUInteger)index {
    self = [super init];
    if (self) {
        self.toIndex = index;
    }
    
    return self;
}

@end
