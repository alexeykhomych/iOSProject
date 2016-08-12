//
//  AKIUserCell.m
//  iOSProject
//
//  Created by Alexey Khomych on 10.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIUserCell.h"

#import "AKIUser.h"
#import "AKIRandomData.h"

@interface AKIUserCell()
@property (nonatomic, retain) AKIRandomData *data;

@end

@implementation AKIUserCell

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    self.data = [AKIRandomData init];
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(AKIUser *)user {
    if (_user != user) {
        _user = user;
        
        [self fillWithModel:user];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(AKIUser *)user {
    self.fullNameLabel.text = self.user.fullName;
    self.userImageView.image = user.image;
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
        UIImage *image = user.image;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.userImageView.image = image;
        });
    });
}

- (void)addField {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setUser:[AKIUser new]];
        });
    });
}

- (void)removeField {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.data removeLastObject];
        });
    });
}

@end
