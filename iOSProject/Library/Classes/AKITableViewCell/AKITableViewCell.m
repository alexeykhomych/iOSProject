//
//  AKITableViewCell.m
//  iOSProject
//
//  Created by Alexey Khomych on 18.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKITableViewCell.h"

@implementation AKITableViewCell

- (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}



@end
