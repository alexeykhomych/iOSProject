//
//  AKIUsersViewController.h
//  iOSProject
//
//  Created by Alexey Khomych on 27.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AKIUsersArrayModel.h"
#import "AKIManagedView.h"

@interface AKIUsersViewController : UIViewController <
    UITableViewDelegate,
    UITableViewDataSource,
    UISearchBarDelegate,
    AKIArrayModelObserver
>

@property (nonatomic, strong) AKIUsersArrayModel *model;

- (IBAction)onAddButton:(id)sender;
- (IBAction)onEditButton:(id)sender;

- (void)addModel:(id)model;

@end
