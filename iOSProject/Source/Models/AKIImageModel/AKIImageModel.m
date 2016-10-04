//
//  AKIImageModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 16.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIImageModel.h"

#import "AKIGCD.h"

#import "NSFileManager+AKIExtensions.h"

#import "AKIMacro.h"

AKIStringConstant(FileName, @"Images");

@interface AKIImageModel ()
@property (nonatomic, strong)       UIImage     *image;
@property (nonatomic, strong)       NSURL       *url;
@property (nonatomic, readonly)     BOOL        cached;

@property (nonatomic, readonly)             NSFileManager   *fileManager;
@property (nonatomic, readonly, copy)       NSString        *path;
@property (nonatomic, readonly, copy)       NSString        *fileName;
@property (nonatomic, readonly, copy)       NSString        *filePath;

@property (nonatomic, readonly) NSURLSession *session;
@property (nonatomic, strong)   NSURLSessionDownloadTask    *downloadTask;

- (void)downloadImageFromInternet;
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
    
//    self.url = url ? url : [self defaultURL];
    self.url = [NSURL URLWithString:@"http://mirgif.com/humor/prikol104.jpg"];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

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

- (NSString *)path {
    return [NSFileManager pathForDocuments];
}

- (BOOL)cached {
    return [self.fileManager fileExistsAtPath:self.filePath];
}

- (NSURLSession *)session {
    return [NSURLSession sharedSession];
}

#pragma mark -
#pragma mark Private

- (NSURL *)defaultURL {
    return [[NSBundle mainBundle] executableURL];
}

- (void)performLoading {
    if (!self.cached) {
        [self downloadImageFromInternet];
        
        return;
    }
    
    UIImage *downloadedImage = [UIImage imageWithContentsOfFile:self.filePath];
    [self finishDownloadingImage:downloadedImage];
}

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

- (void)finishDownloadingImage:(UIImage *)downloadedImage {
    self.image = downloadedImage;
    self.state = downloadedImage ? AKIModelDidLoad : AKIModelDidFailLoading;
}

@end
