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

@implementation AKIImageView

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self initSubviews];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (!self.imageView) {
        [self initSubviews];
    }
    
    return self;
}

- (void)initSubviews {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.imageView = imageView;
}

#pragma mark -
#pragma mark Views Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if (!self.imageView) {
        [self initSubviews];
    }
}

#pragma mark -
#pragma mark Accessors

- (void)setImageModel:(AKIImageModel *)imageModel {
    if (_imageModel != imageModel) {
        [_imageModel removeObserver:self];
       
        _imageModel = imageModel;
        
        [_imageModel addObserver:self];
        
        self.model = _imageModel;
        
        [_imageModel load];
    }
}

- (void)setImageView:(UIImageView *)imageView {
    if (_imageView != imageView) {
        [_imageView removeFromSuperview];
        _imageView = imageView;
        
        [self addSubview:imageView];
    }
}

#pragma mark -
#pragma mark Observer

- (void)modelDidLoad:(AKIImageModel *)model {
    AKIWeakify(self);
    AKIAsyncPerformInMainQueue(^{
        AKIStrongifyAndReturnIfNil(self);
        self.imageView.image = model.image;
        
        [super modelDidLoad:model];
    });
}

- (void)modelDidFailLoading:(AKIImageModel *)model {
    AKIWeakify(self);
    AKIAsyncPerformInMainQueue(^{
        AKIStrongifyAndReturnIfNil(self);
        NSLog(@"DID FAIL LOADING");
//        [self.imageModel load];
    });
}

@end
