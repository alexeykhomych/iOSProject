//
//  AKILoadingViewContainerController.h
//  iOSProject
//
//  Created by Alexey Khomych on 26.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AKIModel.h" 

@class AKILoadingViewContainer;
@class AKIModel;

@interface AKISuperViewController : UIViewController <AKIObservableModel>
@property (nonatomic, readonly) AKILoadingViewContainer  *container;
@property (nonatomic, strong)   AKIModel        *model;

@end
