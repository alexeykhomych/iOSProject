//
//  AKIFilteredArrayModel.h
//  iOSProject
//
//  Created by Alexey Khomych on 14.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayModel.h"

@interface AKIFilteredArrayModel : AKIArrayModel
@property (nonatomic, readonly) NSPredicate *predicate;

- (instancetype)initWithModel:(id)model;

- (void)filterObjects;

@end
