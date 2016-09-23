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
@property (nonatomic, strong) UIImageView *imageView;

- (void)initSubviews;

@end

@implementation AKIImageView

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    [self initSubviews];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self initSubviews];
    
    return self;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
}

#pragma mark -
#pragma mark AKIObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case AKIImageDidUnload:
            return @selector(modelDidUnload:);
            
        case AKIImageDidLoad:
            return @selector(modelDidLoad:);
            
        case AKIImageWillLoad:
            return @selector(modelWillLoad:);
            
        case AKIImageDidFailLoading:
            return @selector(modelDidFailLoading:);
            
        default:
            return nil;
    }
}

#pragma mark -
#pragma mark Public

- (void)load {
    @synchronized (self) {
//        self.state = AKIImageWillLoad;
        
        AKIAsyncPerformInBackground(^{
            
        });
        
//        self.state = AKIImageDidLoad;
    }
}

#pragma mark -
#pragma mark Private

- (void)initSubviews {
    id imageView = [[UIImageView alloc] init];
    self.imageView = imageView;
    [self addSubview:imageView];
    
    [self setNeedsLayout];
}

@end
