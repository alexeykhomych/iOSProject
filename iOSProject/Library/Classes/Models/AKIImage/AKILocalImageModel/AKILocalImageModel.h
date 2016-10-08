//
//  AKILocalImageModel.h
//  iOSProject
//
//  Created by Alexey Khomych on 04.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIImageModel.h"

#import <UIKit/UIKit.h>

@interface AKILocalImageModel : AKIImageModel

- (UIImage *)loadImageAtURL:(NSURL *)url;

@end
