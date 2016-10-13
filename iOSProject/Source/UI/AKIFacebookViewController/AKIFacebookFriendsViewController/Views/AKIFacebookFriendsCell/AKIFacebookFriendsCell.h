//
//  AKIFacebookFriendsCell.h
//  iOSProject
//
//  Created by Alexey Khomych on 09.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKITableViewCell.h"

#import "AKIImageView.h"

@class AKIUser;

@interface AKIFacebookFriendsCell : AKITableViewCell
@property (nonatomic, strong) IBOutlet UILabel          *userName;
@property (nonatomic, strong) IBOutlet AKIImageView     *userImage;
@property (nonatomic, strong) AKIUser *user;

@end
