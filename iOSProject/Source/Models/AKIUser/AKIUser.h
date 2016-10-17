//
//  AKIUser.h
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIModel.h"

@class AKIFBFriends;
@class AKIImageModel;
@class AKIArrayModel;

@interface AKIUser : AKIModel <NSCoding, AKIModelObserver>
@property (nonatomic, copy)     NSString          *ID;
@property (nonatomic, copy)     NSString          *name;
@property (nonatomic, copy)     NSString          *birthday;
@property (nonatomic, copy)     NSString          *country;
@property (nonatomic, copy)     NSString          *city;
@property (nonatomic, strong)   NSURL             *url;

@property (nonatomic, readonly) AKIImageModel     *imageModel;
@property (nonatomic, strong)   AKIArrayModel     *friends;

@end
