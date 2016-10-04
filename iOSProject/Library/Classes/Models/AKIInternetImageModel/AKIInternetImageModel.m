//
//  AKIInternetImageModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 04.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIInternetImageModel.h"

@interface AKIInternetImageModel ()
@property (nonatomic, readonly) NSURLSession *session;
@property (nonatomic, strong)   NSURLSessionDownloadTask    *downloadTask;

@end

@implementation AKIInternetImageModel

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.downloadTask = nil;
}

#pragma mark -
#pragma mark Accessors

- (NSURLSession *)session {
    return [NSURLSession sharedSession];
}

#pragma mark -
#pragma mark Privat

- (void)downloadImageFromInternet {
    id completionHandler = ^(NSURL *location, NSURLResponse *response, NSError *error) {
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *downloadedImage = [UIImage imageWithData:data];
        
        [data writeToFile:self.filePath atomically:YES];
        
        if (!downloadedImage) {
            self.state = AKIModelDidFailLoading;
        }
        
        [self finishDownloadingImage:downloadedImage];
    };
    
    NSURLSessionDownloadTask *downloadTask = self.downloadTask;
    downloadTask = [self.session downloadTaskWithURL:self.url completionHandler:completionHandler];
    [downloadTask resume];
}

@end
