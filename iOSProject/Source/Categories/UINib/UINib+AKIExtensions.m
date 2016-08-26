//
//  UINib+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 21.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "UINib+AKIExtensions.h"

@implementation UINib (AKIExtensions)

+ (id)objectWithClass:(Class)class {
    UINib *nib = [UINib nibWithClass:class];
    
    return [nib objectWithClass:class];
}

+ (instancetype)nibWithClass:(Class)class {
    return [self nibWithClass:class bundle:nil];
}

+ (instancetype)nibWithClass:(Class)class bundle:(NSBundle *)bundle {
    return [self nibWithNibName:NSStringFromClass(class) bundle:bundle];
}

- (id)objectWithClass:(Class)class {
    return [self objectWithClass:(Class)class owner:nil options:nil];
}

- (id)objectWithClass:(Class)class owner:(id)owner options:(NSDictionary *)options {
    NSArray *objects = [self instantiateWithOwner:owner options:options];
    for (id object in objects) {
        if ([object isMemberOfClass:class]) {
            return object;
        }
    }
    
    return nil;
}

@end
