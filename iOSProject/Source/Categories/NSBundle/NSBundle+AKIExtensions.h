//
//  NSBundle+AKIExtensions.h
//  iOSProject
//
//  Created by Alexey Khomych on 10.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSBundle (AKIExtensions)

+ (id)objectWithClass:(id)class;
+ (id)objectWithClass:(id)class owner:(id)owner;
+ (id)objectWithClass:(id)class owner:(id)owner options:(NSDictionary *)options;

- (id)objectWithClass:(Class)class;
- (id)objectWithClass:(Class)class owner:(id)owner;
- (id)objectWithClass:(Class)class owner:(id)owner options:(NSDictionary *)options;

@end
