//
//  AKILocalImageModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 04.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKILocalImageModel.h"

@interface AKILocalImageModel ()
@property (nonatomic, strong)       NSURL       *url;

@end

@implementation AKILocalImageModel

@synthesize url = _url;

#pragma mark -
#pragma mark Class methods

+ (instancetype)imageWithURL:(NSURL *)url {
    return [[super alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Private

- (void)performLoading {
    [self finishLoadingImage:[UIImage imageWithContentsOfFile:self.url.path]];
}

@end
