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
    AKIImageModelFailedLoading = AKIModelFailedLoading,
    AKIImageModelUnloaded
};

@protocol AKIImageModelObserver <NSObject>

@optional
- (void)imageModelFailedLoading;
- (void)imageModelUnloaded;

@end

@interface AKIImageModel : AKIModel <AKIImageModelObserver>
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) NSURL   *url;

+ (instancetype)imageWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url;

- (void)dump;

@end
