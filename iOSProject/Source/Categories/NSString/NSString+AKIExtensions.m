//
//  NSString+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSString+AKIExtensions.h"

#import "NSArray+AKIExtensions.h"

@implementation NSString (AKIExtensions)

+ (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", [self randomName], [self randomSurname]];
}

+ (NSString *)randomName {
    static  NSArray *names = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        names = @[@"Ackerley",
                  @"Acton",
                  @"Adamaris",
                  @"Addison",
                  @"Adney",
                  @"Adolf",
                  @"Aethelder",
                  @"Africa",
                  @"Aiken",
                  @"Ainsley",
                  @"Aaron",
                  @"Alan",
                  @"Connor",
                  @"Conway",
                  @"Cyril",
                  @"Curtis",
                  @"Crosby"];
    });
    
    return [names randomObject];
}

+ (NSString *)randomSurname {
    static NSArray *surnames = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
         surnames = @[@"Abbey",
                      @"Abbott",
                      @"Abel",
                      @"Abney",
                      @"Abharams",
                      @"Abrams",
                      @"AChilles",
                      @"Albertson",
                      @"Albinson",
                      @"Bailey",
                      @"Baldwin",
                      @"Bancroft",
                      @"Banister",
                      @"Banks",
                      @"Badcock",
                      @"Blake",
                      @"Bloodworth"];
    });
    
    return [surnames randomObject];
}

@end
