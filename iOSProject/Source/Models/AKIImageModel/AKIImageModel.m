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

@interface AKIImageModel ()
@property (nonatomic, strong) UIImage   *image;
@property (nonatomic, strong) NSURL     *url;

@end

@implementation AKIImageModel

#pragma mark -
#pragma mark Class methods

+ (instancetype)imageWithURL:(NSURL *)url {
    Class class = url.isFileURL ? [AKILocalImageModel class] : [AKIInternetImageModel class];
    
    return [[class alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithURL:(NSURL *)url {
    self = [self init];
    
    self.url = url;
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)finishLoadingImage:(UIImage *)loadedImage {
    self.image = loadedImage;
    self.state = loadedImage ? AKIModelDidLoad : AKIModelDidFailLoading;
}

@end
