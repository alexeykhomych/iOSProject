//
//  AKIUser.h
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@class AKIImageModel;

@interface AKIUser : NSObject <NSCopying, NSCoding>
@property (nonatomic, copy, readonly) NSString          *userID;
@property (nonatomic, copy, readonly) NSString          *firstName;
@property (nonatomic, copy, readonly) NSString          *secondName;
@property (nonatomic, copy, readonly) NSString          *country;
@property (nonatomic, copy, readonly) NSString          *city;
@property (nonatomic, readonly)       AKIImageModel     *imageModel;

@end
