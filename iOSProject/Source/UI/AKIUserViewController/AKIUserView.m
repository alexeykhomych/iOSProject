//
//  AKIUserView.m
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIUserView.h"
#import "AKIUserCell.h"

@implementation AKIUserView

#pragma mark -
#pragma mark Public

- (void)addFieldWithRandomText {
    [self.cell addField];
}

- (void)removeLastField {
    [self.cell removeField];
}

- (void)sortTable {
    
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    
}

- (void)removeObjectAtIndexSubscript:(NSUInteger)index {
    
}

@end
