//
//  AKIFacebookFriendsView.h
//  iOSProject
//
//  Created by Alexey Khomych on 10.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKILoadingViewContainer.h"

@interface AKIFacebookFriendsView : AKILoadingViewContainer
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property(nonatomic, assign, getter=isEditing) BOOL editing;

@end
