//
//  AKIImageView.h
//  iOSProject
//
//  Created by Alexey Khomych on 15.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIView.h"
#import "AKILoadingViewContainer.h"
#import "AKICacheImageModel.h"

@class AKIImageModel;

@interface AKIImageView : AKILoadingViewContainer
@property (nonatomic, strong) IBOutlet UIImageView  *imageView;
@property (nonatomic, strong)   AKIImageModel       *imageModel;
@property (nonatomic, readonly) AKICacheImageModel  *cacheImageModel;

@end
