//
//  AKIImageModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 16.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIImageModel.h"

#import "AKIGCD.h"

#import "AKIMacro.h"

@interface AKIImageModel ()
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
#pragma mark Private

- (void)performLoading {    
    self.image = [UIImage imageWithContentsOfFile:[self.url path]];
    self.state = self.image ? AKIModelDidLoad : AKIModelWillLoad;
}

@end
