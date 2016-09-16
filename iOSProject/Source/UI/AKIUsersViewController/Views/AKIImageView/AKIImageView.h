//
//  AKIImageView.h
//  iOSProject
//
//  Created by Alexey Khomych on 15.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AKIObservableObject.h"

typedef NS_ENUM(NSUInteger, AKIImageState) {
    AKIImageDidUnload,
    AKIImageDidLoad,
    AKIImageWillLoad,
    AKIImageDidFailLoading,
};

@class AKIImageView;

@protocol AKIImageViewObserver <NSObject>

@optional

- (void)modelDidUnload:(AKIImageView *)model;
- (void)modelDidLoad:(AKIImageView *)model;
- (void)modelWillLoad:(AKIImageView *)model;
- (void)modelDidFailLoading:(AKIImageView *)model;

@end

@interface AKIImageView : UIView


@end
