//
//  AKIUsersViewController.h
//  iOSProject
//
//  Created by Alexey Khomych on 27.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AKIUsersArrayModel.h"

@interface AKIUsersViewController : UIViewController <
    UITableViewDelegate,
    UITableViewDataSource,
    AKIArrayModel
>

@property (nonatomic, retain)   AKIUsersArrayModel  *model;
@property (nonatomic, retain)   NSMutableArray      *users;

- (IBAction)onAddButton:(id)sender;
- (IBAction)onEditButton:(id)sender;

- (void)addModel:(id)model;

@end
