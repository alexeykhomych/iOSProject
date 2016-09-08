//
//  AKIUserView.h
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AKIUserCell;

@interface AKIUserView : UIView
@property (nonatomic, strong) IBOutlet UITableView     *tableView;

@property (nonatomic, strong) IBOutlet UIButton     *addButton;
@property (nonatomic, strong) IBOutlet UIButton     *editButton;

@property(nonatomic, assign, getter=isEditing) BOOL editing;
@property(nonatomic, assign, getter=isEditing) BOOL editingSearchBar;

@property (nonatomic, retain) AKIUserCell *cell;

@end
