//
//  AKIImageModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 16.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIImageModel.h"

#import "AKILocalImageModel.h"

@interface AKIImageModel ()
@property (nonatomic, strong) UIImage *image;

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
    self.localImageModel = [AKILocalImageModel imageWithURL:url];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSURL *)defaultURL {
    return [[NSBundle mainBundle] executableURL];
}

- (void)finishDownloadingImage:(UIImage *)downloadedImage {
    self.image = downloadedImage;
    self.state = downloadedImage ? AKIModelDidLoad : AKIModelDidFailLoading;
}


@end
