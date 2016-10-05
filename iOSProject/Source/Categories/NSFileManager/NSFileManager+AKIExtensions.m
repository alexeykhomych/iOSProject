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

+ (NSString *)cachedFilesPath {
    AKIDispatchOnceFileManagerWithFolder(NSLibraryDirectory);
}

@end
