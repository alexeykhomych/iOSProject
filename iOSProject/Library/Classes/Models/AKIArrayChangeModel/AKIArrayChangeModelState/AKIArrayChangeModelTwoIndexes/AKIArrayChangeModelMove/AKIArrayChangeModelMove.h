//
//  AKIArrayChangeModelMove.h
//  iOSProject
//
//  Created by Alexey Khomych on 03.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayChangeModelTwoIndexes.h"

@interface AKIArrayChangeModelMove : AKIArrayChangeModelTwoIndexes

- (instancetype)initModelFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
