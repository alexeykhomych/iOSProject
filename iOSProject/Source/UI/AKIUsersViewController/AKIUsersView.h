//
//  AKIUsersView.h
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AKILoadingViewContainer.h"

@interface AKIUsersView : AKILoadingViewContainer
@property (nonatomic, strong) IBOutlet UITableView  *tableView;

@property (nonatomic, strong) IBOutlet UIButton     *addButton;
@property (nonatomic, strong) IBOutlet UIButton     *editButton;

@property (nonatomic, strong) IBOutlet UISearchBar  *searchBar;

@property(nonatomic, assign, getter=isEditing) BOOL editing;

@end
