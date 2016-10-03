//
//  AKIImageModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 16.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIImageModel.h"

#import "AKIGCD.h"

#import "AKIMacro.h"

@interface AKIImageModel ()
@property (nonatomic, strong)       UIImage     *image;
@property (nonatomic, strong)       NSURL       *url;
@property (nonatomic, readonly)     BOOL        cached;

@property (nonatomic, strong) NSMutableDictionary *cache;


@property (nonatomic, readonly)             NSFileManager   *fileManager;
@property (nonatomic, readonly, copy)       NSString        *path;
@property (nonatomic, readonly, copy)       NSString        *fileName;

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
    self.cache = [NSMutableDictionary new];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSFileManager *)fileManager {
    return [NSFileManager defaultManager];
}

- (NSString *)fileName {
    NSArray *separated = [self.url.absoluteString componentsSeparatedByString:@"/"];
    
    return [separated lastObject];
}

- (NSString *)path {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

- (BOOL)cached {
    return [self.fileManager fileExistsAtPath:[self.path stringByAppendingPathComponent:self.fileName]];
}

#pragma mark -
#pragma mark Private

- (NSURL *)defaultURL {
    return [[NSBundle mainBundle] executableURL];
}

- (void)performLoading {
    if (!self.cached) {
        [self downloadImageFromInternet];
    }
    
    UIImage *image = [UIImage imageWithContentsOfFile:self.path];
    self.image = image;
    self.state = image ? AKIModelDidLoad : AKIModelWillLoad;
}

- (void)downloadImageFromInternet {
    NSURLSessionDownloadTask *downloadImageTask = [[NSURLSession sharedSession]
                                                   downloadTaskWithURL:self.url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                                       NSData *data = [NSData dataWithContentsOfURL:location];
                                                       UIImage *downloadedImage = [UIImage imageWithData:data];
                                                       
                                                       [data writeToFile:self.path atomically:YES];
                                                       
                                                       if (!downloadedImage) {
                                                           self.state = AKIModelDidFailLoading;
                                                       }
                                                       
//                                                       self.image = downloadedImage;
                                                   }];
    
    [downloadImageTask resume];
}

@end
