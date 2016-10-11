//
//  AKIFacebookFriendsDetailView.m
//  iOSProject
//
//  Created by Alexey Khomych on 10.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFacebookFriendsDetailView.h"

#import "AKIUser.h"

@implementation AKIFacebookFriendsDetailView

- (void)setUser:(AKIUser *)user {
    if (_user != user) {
        self.name.text = [NSString stringWithFormat:@"%@ %@", user.firstName, user.secondName];
        self.city.text = [NSString stringWithFormat:@"%@, %@", user.city, user.country];
        self.birthday.text = self.user.birthday;
//        self.imageView.image = user.imageModel;
    }
}

@end
