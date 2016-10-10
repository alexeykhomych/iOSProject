//
//  NSFileManager+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 04.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSFileManager+AKIExtensions.h"

#define AKICreateDirectoryAtPath(path) \
    NSFileManager *fileManager = [NSFileManager defaultManager];\
    if (![fileManager fileExistsAtPath:path]) { \
        [fileManager createDirectoryAtPath:path \
                withIntermediateDirectories:YES \
                                attributes:nil \
                                    error:NULL]; \
    }

#define AKIFolderPath(path, folder) \
    [[NSSearchPathForDirectoriesInDomains(path, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:folder]

#define AKIDispatchOnceFileManagerWithFolder(funcName, path, folderName) \
    static dispatch_once_t onceToken; \
    static id result = nil; \
    dispatch_once(&onceToken, ^{ \
        AKICreateDirectoryAtPath(AKIFolderPath(path, folderName)); \
        result = [NSSearchPathForDirectoriesInDomains(path, NSUserDomainMask, YES) firstObject]; \
    }); \
    return result;

#define AKIImplementationDispatchOnceFunctionReturnResult(funcName, path) \
    AKIImplementationDispatchOnceFunctionWithFolderNameReturnResult(funcName, path, @"")

#define AKIImplementationDispatchOnceFunctionWithFolderNameReturnResult(funcName, path, folderName) \
    + (NSString *)funcName {\
        AKIDispatchOnceFileManagerWithFolder(funcName, path, folderName) \
    }

#define AKIDispatchOnce(field, type, block) \
    static dispatch_once_t onceToken; \
    static type field = nil; \
    dispatch_once(&onceToken, ^{ \
        AKICreateDirectoryAtPath(AKIFolderPath(path, folderName)); \
        retult = block; \
    }); \
    return result;

@implementation NSFileManager (AKIExtensions)


AKIImplementationDispatchOnceFunctionReturnResult(documentsPath, NSDocumentDirectory)
AKIImplementationDispatchOnceFunctionReturnResult(libraryPath, NSLibraryDirectory)

+ (NSString *)cachedFilesPathWithFolder:(NSString *)folderName {
    AKIDispatchOnceFileManagerWithFolder(cachedFilesPathWithFolder, NSLibraryDirectory, folderName)

    
//    AKIDispatchOnce(result, NSString*, [NSSearchPathForDirectoriesInDomains(path, NSUserDomainMask, YES) firstObject]);
}

@end
