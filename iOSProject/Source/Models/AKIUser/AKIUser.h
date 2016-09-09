//
//  AKIUser.h
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface AKIUser : NSObject
@property (nonatomic, copy, readonly)     NSString    *fullName;
@property (nonatomic, readonly)           UIImage     *image;

@end
