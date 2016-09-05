//
//  AKIArrayChangeModelInsert.h
//  iOSProject
//
//  Created by Alexey Khomych on 03.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayChangeModelOneIndex.h"

@interface AKIArrayChangeModelInsert : AKIArrayChangeModelOneIndex

- (instancetype)initModelWithIndex:(NSUInteger)index;

@end
