//
//  NSString+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSString+AKIExtensions.h"

#import "AKIRandomName.h"

@implementation NSString (AKIExtensions)

+ (NSString *)fullName {
    return [[AKIRandomName alloc]  nameWithSurname];
}

@end
