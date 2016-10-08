//
//  AKIInternetImageModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 04.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIInternetImageModel.h"

#import "NSFileManager+AKIExtensions.h"

typedef void (^AKICompletionHandler)(NSURL *location, NSURLResponse *response, NSError *error);

@interface AKIInternetImageModel ()
@property (nonatomic, readonly) NSURLSession                *session;
@property (nonatomic, strong)   NSURLSessionDownloadTask    *downloadTask;

@property (nonatomic, readonly)             NSFileManager   *fileManager;
@property (nonatomic, readonly, copy)       NSString        *path;
@property (nonatomic, readonly, copy)       NSString        *fileName;
@property (nonatomic, readonly, copy)       NSString        *filePath;
@property (nonatomic, readonly) BOOL cached;

- (AKICompletionHandler)completionHandler;
- (void)removeCorruptedImage;
- (NSURL *)fileURL;

@end

@implementation AKIInternetImageModel

@dynamic session;
@dynamic fileManager;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.downloadTask = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    if (_downloadTask != downloadTask) {
        [_downloadTask cancel];
        _downloadTask = downloadTask;
        [_downloadTask resume];
    }
}

- (NSURLSession *)session {
    return [NSURLSession sharedSession];
}

- (NSFileManager *)fileManager {
    return [NSFileManager defaultManager];
}

- (NSString *)fileName {
    NSCharacterSet *characterSet = [NSCharacterSet URLUserAllowedCharacterSet];
    
    return [self.url.absoluteString stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
}

- (NSString *)filePath {
    return [self.path stringByAppendingPathComponent:self.fileName];
}

- (NSURL *)fileURL {
    return self.url;
}

- (NSString *)path {
    return [NSFileManager documentsPath];
}

- (BOOL)cached {
    return [self.fileManager fileExistsAtPath:self.filePath];
}

#pragma mark -
#pragma mark Privat

- (AKICompletionHandler)completionHandler {
    return ^(NSURL *location, NSURLResponse *response, NSError *error) {
        UIImage *downloadedImage = nil;
        
        if (!error) {
            [self.fileManager copyItemAtPath:location.path toPath:self.filePath error:NULL];
            downloadedImage = [UIImage imageNamed:self.filePath];
        }
        
        [self finishLoadingImage:downloadedImage];
    };;
}

- (void)performLoading {
    if (self.cached) {
        UIImage *image = [self loadImageAtURL:self.fileURL];
        if (image) {
            [self finishLoadingImage:image];
        } else {
            [self removeCorruptedImage];
        }
        
        [self loadFromInternet];
    }
}

- (void)removeCorruptedImage {
    [self.fileManager removeItemAtPath:self.filePath error:NULL];
}

- (void)loadFromInternet {
    self.downloadTask = [self.session downloadTaskWithURL:self.url completionHandler:[self completionHandler]];
}

@end
