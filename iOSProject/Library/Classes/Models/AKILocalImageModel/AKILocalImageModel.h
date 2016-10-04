//
//  AKILocalImageModel.h
//  iOSProject
//
//  Created by Alexey Khomych on 04.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIModel.h"

#import <UIKit/UIKit.h>

@interface AKILocalImageModel : AKIModel
@property (nonatomic, readonly)             NSFileManager   *fileManager;
@property (nonatomic, readonly, copy)       NSString        *path;
@property (nonatomic, readonly, copy)       NSString        *fileName;
@property (nonatomic, readonly, copy)       NSString        *filePath;

@property (nonatomic, readonly)       NSURL       *url;

+ (instancetype)imageWithURL:(NSURL *)url;

- (void)finishDownloadingImage:(UIImage *)downloadedImage;

@end
