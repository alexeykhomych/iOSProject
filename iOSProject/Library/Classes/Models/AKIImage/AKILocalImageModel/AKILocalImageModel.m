//
//  AKILocalImageModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 04.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKILocalImageModel.h"

@implementation AKILocalImageModel

#pragma mark -
#pragma mark Public

- (UIImage *)loadImageAtURL:(NSURL *)url {
    return [UIImage imageWithContentsOfFile:url.absoluteString];
}

#pragma mark -
#pragma mark Private

- (void)performLoading {
    [self finishLoadingImage:[self loadImageAtURL:self.url]];
}

@end
