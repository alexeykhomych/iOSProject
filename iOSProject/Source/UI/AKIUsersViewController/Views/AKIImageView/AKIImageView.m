//
//  AKIImageView.m
//  iOSProject
//
//  Created by Alexey Khomych on 15.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIImageView.h"

#import "AKIGCD.h"

#import "AKIUserCell.h"

@interface AKIImageView ()
@property (nonatomic, assign) AKIImageState state;

@end

@implementation AKIImageView

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)load {
    @synchronized (self) {
        self.state = AKIImageWillLoad;
        
        AKIAsyncPerformInBackground(^{
            
        });
        
        self.state = AKIImageDidLoad;
    }
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

@end
