//
//  AKIArrayChangeModel.h
//  iOSProject
//
//  Created by Alexey Khomych on 30.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UITableView+AKIExtensions.h"

@class AKIArrayModel;

@interface AKIArrayChangeModel : NSObject

+ (id)insertModelAtIndex:(NSUInteger)index;
+ (id)removeModelAtIndex:(NSUInteger)index;
+ (id)moveModelFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
