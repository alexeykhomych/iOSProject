//
//  NSString+AKIRandomName.m
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSString+AKIRandomName.h"

#import "AKIRandomName.h"

@implementation NSString (AKIRandomName)

#pragma mark -
#pragma mark Class methods

+ (instancetype)randomName {
    return [NSString stringWithFormat:@"%@", [AKIRandomName randomName]];
}

+ (instancetype)randomSurname {
    return [NSString stringWithFormat:@"%@", [AKIRandomName randomSurname]];
}

@end
