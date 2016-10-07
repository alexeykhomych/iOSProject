//
//  AKILocalImageModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 04.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKILocalImageModel.h"

@implementation AKILocalImageModel

#pragma mark -
#pragma mark Private

- (void)performLoading {
    [self finishLoadingImage:[UIImage imageWithContentsOfFile:self.url]];
}

@end
