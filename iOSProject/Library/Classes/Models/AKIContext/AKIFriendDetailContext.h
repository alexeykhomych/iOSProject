//
//  AKIFriendDetailContext.h
//  iOSProject
//
//  Created by Alexey Khomych on 17.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFacebookContext.h"

@class AKIUser;

@interface AKIFriendDetailContext : AKIFacebookContext
@property (nonatomic, strong) AKIUser *user;

@end
