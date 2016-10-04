//
//  AKILocalImageModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 04.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKILocalImageModel.h"

#import "AKIInternetImageModel.h"

#import "AKIGCD.h"

#import "NSFileManager+AKIExtensions.h"

#import "AKIMacro.h"

@interface AKILocalImageModel ()
@property (nonatomic, strong)       UIImage     *image;
@property (nonatomic, strong)       NSURL       *url;
@property (nonatomic, readonly)     BOOL        cached;

- (NSURL *)defaultURL;

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
    self.url = url ? url : [self defaultURL];
    
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

- (void)finishDownloadingImage:(UIImage *)downloadedImage {
    self.image = downloadedImage;
    self.state = downloadedImage ? AKIModelDidLoad : AKIModelDidFailLoading;
}

@end
