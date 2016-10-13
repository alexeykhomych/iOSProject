//
//  NSFileManager+AKIExtensions.m
//  iOSProject
//
//  Created by Alexey Khomych on 04.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSFileManager+AKIExtensions.h"

#import "AKIMacro.h"

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
    AKICreateDirectoryAtPath(AKIFolderPath(path, folderName)); \
    AKIReturnOnce(funcName, NSString, ^{ \
        return [NSSearchPathForDirectoriesInDomains(path, NSUserDomainMask, YES) firstObject]; \
    })

#define AKIImplementationDispatchOnceFunctionReturnResult(funcName, path) \
    AKIImplementationDispatchOnceFunctionWithFolderNameReturnResult(funcName, path, @"")

#define AKIImplementationDispatchOnceFunctionWithFolderNameReturnResult(funcName, path, folderName) \
    + (NSString *)funcName {\
        AKIDispatchOnceFileManagerWithFolder(funcName, path, folderName) \
    }

@implementation NSFileManager (AKIExtensions)

AKIImplementationDispatchOnceFunctionReturnResult(documentsPath, NSDocumentDirectory)
AKIImplementationDispatchOnceFunctionReturnResult(libraryPath, NSLibraryDirectory)

+ (NSString *)cachedFilesPathWithFolder:(NSString *)folderName {
    AKIReturnOnce(result, NSString, ^{ return [NSString new];});
}

@end
