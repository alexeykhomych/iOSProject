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

- (NSURL *)defaultURL;

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
    
    self.url = url ? url : [self defaultURL];
    
    return self;
}

#pragma mark -
#pragma mark Private

- (void)performLoading {    
    UIImage *image = [UIImage imageWithContentsOfFile:[self.url path]];
    self.image = image;
    self.state = image ? AKIModelDidLoad : AKIModelWillLoad;
}

- (NSURL *)defaultURL {
    return [[NSBundle mainBundle] URLForResource:@"image" withExtension:@"jpg"];
}

@end
