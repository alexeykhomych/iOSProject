//
//  AKIArrayChangeModelInsert.m
//  iOSProject
//
//  Created by Alexey Khomych on 03.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayChangeModelInsert.h"

@implementation AKIArrayChangeModelInsert

- (instancetype)initWithIndex:(NSUInteger)index {
    self = [super init];
    if (self) {
        self.toIndex = index;
    }
    
    return self;
}

@end
