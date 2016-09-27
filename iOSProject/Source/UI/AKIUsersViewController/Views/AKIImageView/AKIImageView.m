//
//  AKIImageView.m
//  iOSProject
//
//  Created by Alexey Khomych on 15.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIImageView.h"

#import "AKIImageModel.h"

#import "AKIGCD.h"

#import "AKIUserCell.h"

@interface AKIImageView ()

- (void)imageViewAutoresizing;

@end

@implementation AKIImageView

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [super initWithCoder:aDecoder];
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [super initWithFrame:frame];
}

#pragma mark -
#pragma mark Accessors

- (void)setImageModel:(AKIImageModel *)imageModel {
    if (_imageModel != imageModel) {
        [_imageModel removeObserver:self];
       
        _imageModel = imageModel;
        
        [_imageModel addObserver:self];

        [_imageModel load];
    }
}

- (void)setImageView:(UIImageView *)imageView {
    if (_imageView != imageView) {
        [_imageView removeFromSuperview];
        _imageView = imageView;
        
        [self imageViewAutoresizing];
        
        [self addSubview:imageView];
    }
}

#pragma mark -
#pragma mark Private

- (void)imageViewAutoresizing {
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin
                                        |UIViewAutoresizingFlexibleRightMargin
                                        |UIViewAutoresizingFlexibleBottomMargin;
}

@end
