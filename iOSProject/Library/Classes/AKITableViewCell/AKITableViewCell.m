//
//  AKITableViewCell.m
//  iOSProject
//
//  Created by Alexey Khomych on 18.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKITableViewCell.h"

@implementation AKITableViewCell

#pragma mark -
#pragma mark Accessors

- (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}



@end
