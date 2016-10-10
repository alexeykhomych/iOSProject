//
//  AKIUser.m
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIUser.h"

#import "AKIImageModel.h"

#import "NSString+AKIExtensions.h"

#import "AKIMacro.h"

AKIStringConstant(ID, @"kAKIID");
AKIStringConstant(FirstName, @"kAKIFirstName");
AKIStringConstant(SecondName, @"kAKISecondName");
AKIStringConstant(Country, @"kAKICountry");
AKIStringConstant(City, @"kAKICity");

@interface AKIUser()
@property (nonatomic, copy) NSString    *ID;
@property (nonatomic, copy) NSString    *firstName;
@property (nonatomic, copy) NSString    *secondName;
@property (nonatomic, copy) NSString    *country;
@property (nonatomic, copy) NSString    *city;

@end

@implementation AKIUser

@dynamic imageModel;

#pragma mark -
#pragma mark Initialization and Deallocation 

- (instancetype)init {
    self = [super init];
    
    if (self) {
//        self.fullName = [NSString fullName];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (AKIImageModel *)imageModel {
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"image" withExtension:@"jpg"];
    NSURL *url = [NSURL URLWithString:@"http://mirgif.com/humor/prikol104.jpg"];
    
    return [AKIImageModel imageWithURL:url];
}

#pragma mark -
#pragma mark NSCopying

#define AKIDecode(object, key) self.object = [aDecoder decodeObjectForKey:key];

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
//    self.fullName = [aDecoder decodeObjectForKey:kAKIFullNameKey];
    
    AKIDecode(ID, kAKIID)
    AKIDecode(firstName, kAKIFirstName)
    AKIDecode(secondName, kAKISecondName)
    AKIDecode(country, kAKICountry)
    AKIDecode(city, kAKICity);
    
    return self;
}

#undef AKIDecode

#define AKIEncode(object, key) [aCoder encodeObject:object forKey:key];

- (void)encodeWithCoder:(NSCoder *)aCoder {
    AKIEncode(self.ID, kAKIID)
    AKIEncode(self.firstName, kAKIFirstName)
    AKIEncode(self.secondName, kAKISecondName)
    AKIEncode(self.country, kAKICountry)
    AKIEncode(self.city, kAKICity)
}

#undef AKIEncode

@end
