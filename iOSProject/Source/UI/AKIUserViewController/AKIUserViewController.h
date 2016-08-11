//
//  AKIUserViewController.h
//  iOSProject
//
//  Created by Alexey Khomych on 27.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKIUserView.h"
@class AKIUser;

@interface AKIUserViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain)   AKIUser *user;

- (IBAction)onAddField:(id)sender;
- (IBAction)onRemoveField:(id)sender;
- (IBAction)onSortTable:(id)sender;

@end
