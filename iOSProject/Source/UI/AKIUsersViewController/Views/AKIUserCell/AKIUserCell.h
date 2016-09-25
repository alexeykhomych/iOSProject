//
//  AKIUserCell.h
//  iOSProject
//
//  Created by Alexey Khomych on 10.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKITableViewCell.h"

@class AKIUser;
@class AKIImageView;

@interface AKIUserCell : AKITableViewCell
@property (nonatomic, strong)   IBOutlet UILabel        *fullNameLabel;
@property (nonatomic, strong)   IBOutlet AKIImageView   *userImageView;
@property (nonatomic, strong)   AKIUser                 *user;

- (void)fillWithModel:(AKIUser *)user;

@end
