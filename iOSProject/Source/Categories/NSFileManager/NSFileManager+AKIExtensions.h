//
//  NSFileManager+AKIExtensions.h
//  iOSProject
//
//  Created by Alexey Khomych on 04.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (AKIExtensions)

+ (NSString *)documentsPath;
+ (NSString *)libraryPath;
+ (NSString *)cachedFilesPath;

@end
