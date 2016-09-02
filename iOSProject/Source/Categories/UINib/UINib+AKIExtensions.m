//
//  UINib+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 21.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "UINib+AKIExtensions.h"

#import "NSArray+AKIExtensions.h"

@implementation UINib (AKIExtensions)

+ (id)objectWithClass:(Class)cls {
    UINib *nib = [UINib nibWithClass:cls];
    
    return [nib objectWithClass:cls];
}

+ (instancetype)nibWithClass:(Class)cls {
    return [self nibWithClass:cls bundle:nil];
}

+ (instancetype)nibWithClass:(Class)cls bundle:(NSBundle *)bundle {
    return [self nibWithNibName:NSStringFromClass(cls) bundle:bundle];
}

- (id)objectWithClass:(Class)cls {
    return [self objectWithClass:(Class)cls owner:nil options:nil];
}
- (id)objectWithClass:(Class)cls owner:(id)owner {
    return [self objectWithClass:cls owner:owner options:nil];
}

- (id)objectWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options {
    return [[self instantiateWithOwner:owner options:options] objectWithClass:cls];
}

@end
