//
//  AKIUser.h
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIModel.h"

@class AKIImageModel;

@interface AKIUser : AKIModel <NSCoding, AKIModelObserver>
@property (nonatomic, copy)     NSString          *ID;
@property (nonatomic, copy)     NSString          *firstName;
@property (nonatomic, copy)     NSString          *secondName;
@property (nonatomic, copy)     NSString          *birthday;
@property (nonatomic, copy)     NSString          *country;
@property (nonatomic, copy)     NSString          *city;
@property (nonatomic, readonly) AKIImageModel     *imageModel;

@end
