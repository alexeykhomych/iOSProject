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

@property (nonatomic, strong) IBOutlet UIButton     *addField;
@property (nonatomic, strong) IBOutlet UIButton     *removeField;
@property (nonatomic, strong) IBOutlet UIButton     *sort;

@property(nonatomic, getter=isEditing) BOOL editing;

@property (nonatomic, retain) AKIUserCell *cell;

- (void)setEditing:(BOOL)editing animated:(BOOL)animated;

@end
