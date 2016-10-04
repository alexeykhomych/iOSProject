//
//  AKILocalImageModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 04.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKILocalImageModel.h"

@interface AKILocalImageModel ()
@property (nonatomic, strong)       NSURL       *imageURL;

@end

@implementation AKILocalImageModel

#pragma mark -
#pragma mark Class methods

+ (instancetype)imageWithURL:(NSURL *)url {
    return [[super alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithURL:(NSURL *)url {
    self = [self init];
    self.imageURL = url;
    
    return self;
}

#pragma mark -
#pragma mark Private

- (void)performLoading {    
    [self finishDownloadingImage:[UIImage imageWithContentsOfFile:self.imageURL.path]];
}

@end
