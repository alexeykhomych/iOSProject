//
//  AKIImageView.h
//  iOSProject
//
//  Created by Alexey Khomych on 15.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIView.h"

@class AKIImageModel;

@interface AKIImageView : AKIView
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) AKIImageModel *imageModel;

- (void)imageViewAutoresizing:(UIViewAutoresizing)autoresizing;

@end
