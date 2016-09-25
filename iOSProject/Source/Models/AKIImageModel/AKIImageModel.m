//
//  AKIImageModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 16.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIImageModel.h"

#import "AKIMacro.h"

#import "AKIGCD.h"

@interface AKIImageModel()
@property (nonatomic, strong) UIImage       *image;
@property (nonatomic, strong) NSURL         *url;

@end

@implementation AKIImageModel

#pragma mark -
#pragma mark Class methods

+ (instancetype)imageWithURL:(NSURL *)url {
    return [[super alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithURL:(NSURL *)url {
    self = [self init];
    
    if (self) {
        self.url = url;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors


#pragma mark -
#pragma mark Public

- (void)dump {
    self.image = nil;
}

#pragma mark -
#pragma mark Private

- (void)performLoading {
    AKIAsyncPerformInBackground(^{
        self.image = [UIImage imageWithContentsOfFile:[self.url absoluteString]];
        
        self.state = self.image ? AKIModelDidLoad : AKIModelWillLoad;
    });
}

@end
