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

#import "AKICacheImageModel.h"

@interface AKIImageModel ()
@property (nonatomic, strong) UIImage   *image;
@property (nonatomic, strong) NSURL     *url;
@property (nonatomic, strong) AKICacheImageModel *cacheImageModel;

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

- (void)dealloc {
    [self.cacheImageModel removeObjectForKey:self.url.absoluteString];
}

- (instancetype)initWithURL:(NSURL *)url {
    self = [self init];
    self.cacheImageModel = [AKICacheImageModel cache];
    
    id model = [self.cacheImageModel objectForKey:url.absoluteString];
    
    if (model) {
        return model;
    }
    
    self.url = url;
    [self.cacheImageModel addObject:self forKey:url.absoluteString];
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)finishLoadingImage:(UIImage *)loadedImage {
    self.image = loadedImage;
    self.state = loadedImage ? AKIModelDidLoad : AKIModelDidFailLoading;
}

- (void)modelDidFailLoading:(id)model {
    
}

@end
