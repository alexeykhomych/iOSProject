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

#import "AKILoadingView.h"

#import "AKILoadingViewContainer.h"

#import "AKIMacro.h"

@interface AKIImageView ()
@property (nonatomic, strong) AKILoadingViewContainer  *container;

- (void)defaultImageViewAutoresizing;

@end

@implementation AKIImageView

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self initDefaultImageModel];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (!self.imageView.image) {
        [self initDefaultImageModel];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setImageModel:(AKIImageModel *)imageModel {
    if (_imageModel != imageModel) {
        [_imageModel removeObserver:self];
       
        _imageModel = imageModel;
        
        [_imageModel addObserver:self];

        self.container.model = _imageModel;
        
        [_imageModel load];
    }
}

- (void)setImageView:(UIImageView *)imageView {
    if (_imageView != imageView) {
        [_imageView removeFromSuperview];
        _imageView = imageView;
        
        [self defaultImageViewAutoresizing];
        
        [self addSubview:imageView];
    }
}

#pragma mark -
#pragma mark Observer

- (void)modelDidLoad:(AKIImageModel *)model {
    self.imageView.image = model.image;
}

#pragma mark -
#pragma mark Public

- (void)imageViewAutoresizing:(UIViewAutoresizing)autoresizing {
    self.imageView.autoresizingMask = autoresizing;
}

#pragma mark -
#pragma mark Private

- (void)initSubviews {
    if (!self.container) {
        self.container = [[AKILoadingViewContainer alloc] init];
    }
    
    [self initLoadingView];
}

- (void)initLoadingView {
    AKILoadingView *loadingView = [AKILoadingView loadingViewInSuperview:self];
    loadingView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin
                                    |UIViewAutoresizingFlexibleRightMargin
                                    |UIViewAutoresizingFlexibleBottomMargin;
    
    self.loadingView = loadingView;
}

- (void)initDefaultImageModel {
    self.imageModel = [[AKIImageModel alloc] initWithURL:nil];
}

- (void)defaultImageViewAutoresizing {
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin
                                        |UIViewAutoresizingFlexibleRightMargin
                                        |UIViewAutoresizingFlexibleBottomMargin;
}

@end
