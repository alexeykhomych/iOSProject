//
//  AKIAbstractViewController.h
//  iOSProject
//
//  Created by Alexey Khomych on 26.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AKIModel.h"

@class AKILoadingViewContainer;

@interface AKIAbstractViewController : UIViewController <AKIModelObserver>
@property (nonatomic, strong)   id        model;

@end
