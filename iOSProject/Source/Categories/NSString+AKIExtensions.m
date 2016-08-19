//
//  NSString+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSString+AKIExtensions.h"

@implementation NSString (AKIExtensions)

#pragma mark -
#pragma mark Class methods

+ (NSString *)fullName {
    return [[self alloc]  nameWithSurname];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)nameWithSurname {
    return [NSString stringWithFormat:@"%@ %@", [self randomName], [self randomSurname]];
}

#pragma mark -
#pragma mark Private methods

- (NSString *)randomName {
    static  NSArray *names;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        names = @[@"Ackerley", @"Acton", @"Adamaris", @"Addison", @"Adney", @"Adolf", @"Aethelder", @"Africa", @"Aiken", @"Ainsley", @"Aaron", @"Alan", @"Connor", @"Conway", @"Cyril", @"Curtis", @"Crosby"];
    });
    
    return [names objectAtIndex:arc4random_uniform((u_int32_t)names.count)];
}

- (NSString *)randomSurname {
    static NSArray *surnames;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
         surnames = @[@"Abbey", @"Abbott", @"Abel", @"Abney", @"Abharams", @"Abrams", @"AChilles", @"Albertson", @"Albinson", @"Bailey", @"Baldwin", @"Bancroft", @"Banister", @"Banks", @"Badcock", @"Blake", @"Bloodworth"];
    });
    
    return [surnames objectAtIndex:arc4random_uniform((u_int32_t)surnames.count)];
}

@end
