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
@property (nonatomic, strong) UIImage       *image;
@property (nonatomic, strong) NSURL         *url;

@property (nonatomic, copy)     NSString    *imageName;
@property (nonatomic, assign)   BOOL        cached;

- (void)downloadImage:(NSString *)path;

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
    
    self.url = url ? url : [self defaultURL];
    
    return self;
}

#pragma mark -
#pragma mark Private

- (void)load {
    if (!self.cached) {
        [self downloadImage:self.url.absoluteString];
        
        return;
    }
    
    [super load];
}

- (void)performLoading {    
    UIImage *image = [UIImage imageWithContentsOfFile:[self.url path]];
    self.image = image;
    self.state = image ? AKIModelDidLoad : AKIModelWillLoad;
}

- (NSURL *)defaultURL {
    return [[NSBundle mainBundle] URLForResource:@"image" withExtension:@"jpg"];
}

- (void)downloadImage:(NSString *)path {
    AKIAsyncPerformInBackground(^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:path]];
        self.image = [UIImage imageWithData:data];
        
        self.state = AKIModelDidLoad;
    });
}

@end
