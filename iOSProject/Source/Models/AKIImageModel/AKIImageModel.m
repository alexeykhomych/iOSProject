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
    
    UIImage *image = [UIImage imageWithContentsOfFile:[self.url path]];
    self.image = image;
    self.state = image ? AKIModelDidLoad : AKIModelWillLoad;
}

- (void)downloadImageFromInternet {
    AKIAsyncPerformInBackground(^{
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfURL:self.url options:nil error:&error];
        [data writeToFile:self.path atomically:YES];
        self.image = [UIImage imageWithData:data];
        
//        [self save];
        
        self.state = AKIModelDidLoad;
    });
}

#pragma mark -
#pragma mark TEST

-(UIImage *)getImageFromURL:(NSString *)fileURL {
    NSError *error = nil;
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    UIImage *result = [UIImage imageWithData:data];
    
    return result;
}

-(void)saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    if ([[extension lowercaseString] isEqualToString:@"png"]) {
        [UIImagePNGRepresentation(image) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"png"]] options:NSAtomicWrite error:nil];
    } else if ([[extension lowercaseString] isEqualToString:@"jpg"] || [[extension lowercaseString] isEqualToString:@"jpeg"]) {
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"jpg"]] options:NSAtomicWrite error:nil];
    } else {
        NSLog(@"Image Save Failed\nExtension: (%@) is not recognized, use (PNG/JPG)", extension);
    }
}

-(UIImage *)loadImage:(NSString *)fileName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    UIImage *result = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.%@", directoryPath, fileName, extension]];
    
    return result;
}

- (void)test {
    NSString * documentsDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    //Get Image From URL
    UIImage * imageFromURL = [self getImageFromURL:@"http://www.yourdomain.com/yourImage.png"];
    
    //Save Image to Directory
    [self saveImage:imageFromURL withFileName:@"My Image" ofType:@"png" inDirectory:documentsDirectoryPath];
    
    //Load Image From Directory
    UIImage *imageFromWeb = [self loadImage:@"My Image" ofType:@"png" inDirectory:documentsDirectoryPath];
}

@end
