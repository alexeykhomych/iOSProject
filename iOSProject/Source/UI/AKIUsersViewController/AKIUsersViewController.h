//
//  AKIUsersViewController.h
//  iOSProject
//
//  Created by Alexey Khomych on 27.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIAbstractViewController.h"

#import "AKIUsersArrayModel.h"

@interface AKIUsersViewController : AKIAbstractViewController <
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
