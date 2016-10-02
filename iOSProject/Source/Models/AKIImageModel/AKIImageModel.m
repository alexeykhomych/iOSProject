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
    self.url = [NSURL URLWithString:@"https://i.ytimg.com/vi/qPhQsaXjkZ8/maxresdefault.jpg"];
    
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
    return [NSHomeDirectory() stringByAppendingString:@"Documents"];
}

- (BOOL)cached {
    return [self.cache objectForKey:self.path];
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
    
    UIImage *image = [UIImage imageWithContentsOfFile:[self.url path]];
    self.image = image;
    self.state = image ? AKIModelDidLoad : AKIModelWillLoad;
}

- (void)downloadImageFromInternet {
    AKIAsyncPerformInBackground(^{
        NSData *data = [NSData dataWithContentsOfURL:self.url];
        [data writeToFile:self.fileName atomically:YES];
        self.image = [UIImage imageWithData:data];
        
        [self save];
        
        self.state = AKIModelDidLoad;
    });
}

- (void)save {
    [self.cache setObject:self.image forKey:self.url.absoluteString];
}

@end
