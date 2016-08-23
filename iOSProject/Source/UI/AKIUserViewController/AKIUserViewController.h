//
//  AKIUserViewController.h
//  iOSProject
//
//  Created by Alexey Khomych on 27.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKIUserView.h"

@class AKIArrayModel;

@interface AKIUserViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain)   AKIArrayModel       *model;
@property (nonatomic, retain)   NSMutableArray      *users;

- (IBAction)onAddButton:(id)sender;
- (IBAction)onEditButton:(id)sender;

- (void)addModel:(id)model;

@end
