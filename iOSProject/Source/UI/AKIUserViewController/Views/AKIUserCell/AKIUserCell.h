//
//  AKIUserCell.h
//  iOSProject
//
//  Created by Alexey Khomych on 10.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKITableViewCell.h"

@class AKIUser;

@interface AKIUserCell : AKITableViewCell
@property (nonatomic, strong)   IBOutlet    UILabel     *fullNameLabel;
@property (nonatomic, strong)   IBOutlet    UIImageView *userImageView;
@property (nonatomic, strong)   AKIUser                 *user;

@property (nonatomic, readonly) NSArray *data;

- (void)fillWithModel:(AKIUser *)user;
- (void)addField;
- (void)removeField;

@end
