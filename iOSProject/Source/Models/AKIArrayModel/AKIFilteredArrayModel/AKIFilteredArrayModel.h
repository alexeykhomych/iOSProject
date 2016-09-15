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

- (BOOL)filterArrayModelUsingString:(NSString *)searchText;

@end
