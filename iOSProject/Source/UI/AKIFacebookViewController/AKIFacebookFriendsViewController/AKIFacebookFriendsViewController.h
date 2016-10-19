//
//  AKIFacebookFriendsViewController.h
//  iOSProject
//
//  Created by Alexey Khomych on 09.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFacebookViewController.h"

#import "AKIArrayModel.h"

@interface AKIFacebookFriendsViewController :  AKIFacebookViewController <
    UITableViewDelegate,
    UITableViewDataSource,
    UISearchBarDelegate,
    AKIArrayModelObserver
>

@property (nonatomic, strong) AKIArrayModel *model;

@end
