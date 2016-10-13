//
//  AKIFacebookFriendDetailViewController.m
//  iOSProject
//
//  Created by Alexey Khomych on 09.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFacebookFriendDetailViewController.h"

#import "AKIUser.h"

#import "AKIFacebookFriendsDetailView.h"

#import "AKIMacro.h"

AKIViewControllerBaseViewProperty(AKIFacebookFriendDetailViewController, AKIFacebookFriendsDetailView, detailView)

@interface AKIFacebookFriendDetailViewController ()

- (void)fillUser;

@end

@implementation AKIFacebookFriendDetailViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fillUser];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)fillUser {
    AKIUser *user = self.user;
    self.detailView.name.text = user.name;
    self.detailView.city.text = user.city;
    self.detailView.birthday.text = user.birthday;
}

@end
