//
//  AKIFacebookFriendsDetailView.m
//  iOSProject
//
//  Created by Alexey Khomych on 10.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFacebookFriendsDetailView.h"

#import "AKIUser.h"

#import "AKIImageView.h"

@implementation AKIFacebookFriendsDetailView

- (void)setUser:(AKIUser *)user {
    if (_user != user) {
        _user = user;
        self.name.text = user.name;
        self.city.text = [NSString stringWithFormat:@"%@, %@", user.city, user.country];
        self.birthday.text = self.user.birthday;
        self.imageView.imageModel = user.imageModel;
    }
}

@end
