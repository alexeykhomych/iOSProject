//
//  AKIRandomName.m
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIRandomName.h"

@implementation AKIRandomName

#pragma mark -
#pragma mark Private methods

+ (NSString *)randomName {
    NSArray *names = @[@"Ackerley", @"Acton", @"Adamaris", @"Addison", @"Adney", @"Adolf", @"Aethelder", @"Africa", @"Aiken", @"Ainsley", @"Aaron", @"Alan", @"Connor", @"Conway", @"Cyril", @"Curtis", @"Crosby"];
    
    return [names objectAtIndex:arc4random_uniform((u_int32_t)names.count)];
}

+ (NSString *)randomSurname {
    NSArray *surnames = @[@"Abbey", @"Abbott", @"Abel", @"Abney", @"Abharams", @"Abrams", @"AChilles", @"Albertson", @"Albinson", @"Bailey", @"Baldwin", @"Bancroft", @"Banister", @"Banks", @"Badcock", @"Blake", @"Bloodworth"];
    
    return [surnames objectAtIndex:arc4random_uniform((u_int32_t)surnames.count)];
}

@end
