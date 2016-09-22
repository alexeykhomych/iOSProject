//
//  AKIImageModel.h
//  iOSProject
//
//  Created by Alexey Khomych on 16.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AKIModel.h"

typedef NS_ENUM(NSUInteger, AKIImageModelState) {
    AKIImageModelUnloaded,
    AKIImageModelLoading,
    AKIImageModelLoaded,
    AKIImageModelFailedLoading
};

@interface AKIImageModel : AKIModel
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) NSURL   *url;

+ (instancetype)imageWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url;

- (void)load;
- (void)dump;

@end
