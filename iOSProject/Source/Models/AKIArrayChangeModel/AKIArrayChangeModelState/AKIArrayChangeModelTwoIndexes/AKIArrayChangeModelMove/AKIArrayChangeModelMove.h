//
//  AKIArrayChangeModelMove.h
//  iOSProject
//
//  Created by Alexey Khomych on 03.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayChangeModel.h"

@interface AKIArrayChangeModelMove : AKIArrayChangeModel

- (instancetype)initModelFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
