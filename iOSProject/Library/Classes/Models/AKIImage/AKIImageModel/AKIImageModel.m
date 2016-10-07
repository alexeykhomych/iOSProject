 //
//  AKIImageModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 16.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIImageModel.h"

#import "AKILocalImageModel.h"
#import "AKIInternetImageModel.h"		

#import "AKIImageModelCache.h"

@interface AKIImageModel ()
@property (nonatomic, strong) UIImage   *image;
@property (nonatomic, strong) NSURL     *url;

@end

@implementation AKIImageModel

#pragma mark -
#pragma mark Class methods

+ (instancetype)imageWithURL:(NSURL *)url {
    AKIImageModelCache *cachedObjects = [AKIImageModelCache cache];
    
    AKIImageModel *model = [cachedObjects objectForKey:url];
    
    if (model) {
        return model;
    }
    
    Class class = url.isFileURL ? [AKILocalImageModel class] : [AKIInternetImageModel class];
    
    return [[class alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [[AKIImageModelCache cache] removeObject:self]
}

- (instancetype)initWithURL:(NSURL *)url {
    self = [self init];
    
    self.url = url;
    [[AKIImageModelCache cache] addObject:self];
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)finishLoadingImage:(UIImage *)loadedImage {
    self.image = loadedImage;
    self.state = loadedImage ? AKIModelDidLoad : AKIModelDidFailLoading;
}

@end
