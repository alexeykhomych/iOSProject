//
//  AKIUserCell.m
//  iOSProject
//
//  Created by Alexey Khomych on 10.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIUserCell.h"

#import "AKIUser.h"

static NSUInteger const kAKIUserCount = 100;

@interface AKIUserCell()
@property (nonatomic, readonly) NSMutableArray *mutableData;

- (NSArray *)fillArrayWithRandomValues;

@end

@implementation AKIUserCell

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [super initWithCoder:aDecoder];
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
        [self fillArrayWithRandomValues];
    }
}

- (NSArray *)data {
    return [self.mutableData copy];
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
    NSMutableArray *data = self.mutableData;
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [data addObject:[AKIUser new]];
        });
    });
}

- (void)removeField {
    NSMutableArray *data = self.mutableData;
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [data removeLastObject];
        });
    });
}

#pragma mark -
#pragma mark Private

- (NSArray *)fillArrayWithRandomValues {
    NSMutableArray *data = self.mutableData;
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            for (NSUInteger i = 0; i < kAKIUserCount; i++) {
                [data addObject:[AKIUser new]];
            }
        });
    });
    
    return data;
}

@end
