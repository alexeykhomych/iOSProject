//
//  AKIArrayChangeModelDelete.m
//  iOSProject
//
//  Created by Alexey Khomych on 03.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayChangeModelDelete.h"

@implementation AKIArrayChangeModelDelete

- (instancetype)initWithIndex:(NSUInteger)index {
    self = [super init];
    if (self) {
        self.toIndex = index;
    }
    
    return self;
}

@end
