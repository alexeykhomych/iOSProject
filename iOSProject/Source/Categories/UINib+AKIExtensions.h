//
//  UINib+AKIExtensions.h
//  iOSProject
//
//  Created by Alexey Khomych on 21.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (AKIExtensions)

+ (id)objectWithClass:(Class)cls;

+ (instancetype)nibWithClass:(Class)cls;
+ (instancetype)nibWithClass:(Class)cls bundle:(NSBundle *)bundle;

- (id)objectWithClass:(Class)cls;
- (id)objectWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options;

@end
