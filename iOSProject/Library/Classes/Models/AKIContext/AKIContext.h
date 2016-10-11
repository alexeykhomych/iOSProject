//
//  AKIContext.h
//  iOSProject
//
//  Created by Alexey Khomych on 10.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIUser.h"

#import "AKIArrayModel.h"

@interface AKIContext : NSObject
@property (nonatomic, strong) AKIUser       *user;
@property (nonatomic, strong) AKIArrayModel *model;

- (void)execute;
- (void)cancel;

@end
