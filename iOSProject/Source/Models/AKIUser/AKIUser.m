//
//  AKIUser.m
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIUser.h"

#import "NSString+AKIExtensions.h"

#import "AKIMacro.h"

AKIStringConstant(FullNameKey, @"kAKIFullName");

@interface AKIUser()
@property (nonatomic, copy)     NSString    *fullName;

@end

@implementation AKIUser

@dynamic image;

#pragma mark -
#pragma mark Initialization and Deallocation 

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.fullName = [NSString fullName];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (UIImage *)image {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"image" ofType:@"jpg"];
    
    return [UIImage imageWithContentsOfFile:path];
}

#pragma mark -
#pragma mark NSCopying

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.fullName = [aDecoder decodeObjectForKey:kAKIFullNameKey];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.fullName forKey:kAKIFullNameKey];
}

- (id)copyWithZone:(NSZone *)zone {
    AKIUser *user = [AKIUser new];
    user.fullName = self.fullName;
    
    return user;
}

@end
