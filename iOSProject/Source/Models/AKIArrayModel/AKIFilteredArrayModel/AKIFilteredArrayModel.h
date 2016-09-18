//
//  AKIFilteredArrayModel.h
//  iOSProject
//
//  Created by Alexey Khomych on 14.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayModel.h"

@interface AKIFilteredArrayModel : AKIArrayModel
@property (nonatomic, readonly) AKIArrayModel *containerModel;
- (void)addModelToFilter:(AKIArrayModel *)model;

- (void)filterUsingString:(NSString *)searchText;

@end
