//
//  AKIImageView.h
//  iOSProject
//
//  Created by Alexey Khomych on 15.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIManagedView.h"

@class AKIView;
@class AKIImageModel;

@interface AKIImageView : AKIView
@property (nonatomic, strong) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) AKIImageModel *imageModel;

@end
