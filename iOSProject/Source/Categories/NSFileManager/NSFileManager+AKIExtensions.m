//
//  NSFileManager+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 04.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSFileManager+AKIExtensions.h"

#define AKIDispatchOnceFileManagerWithFolder(folder) \
    static dispatch_once_t onceToken; \
    static id result = nil; \
    dispatch_once(&onceToken, ^{ \
        result = [NSSearchPathForDirectoriesInDomains(folder, NSUserDomainMask, YES) firstObject]; \
    }); \
    return result

@implementation NSFileManager (AKIExtensions)

+ (NSString *)documentsPath {
    AKIDispatchOnceFileManagerWithFolder(NSDocumentDirectory);
}

+ (NSString *)libraryPath {
    AKIDispatchOnceFileManagerWithFolder(NSLibraryDirectory);
}

+ (NSString *)cachedFilesPathWithFolder:(NSString *)folderName {
    NSString *path = [[self libraryPath] stringByAppendingPathComponent:folderName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError *error = nil;
    
    if (![fileManager fileExistsAtPath:path]) {
        [fileManager createDirectoryAtPath:path
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:&error];
    }
    
    AKIDispatchOnceFileManagerWithFolder(path);
}

@end
