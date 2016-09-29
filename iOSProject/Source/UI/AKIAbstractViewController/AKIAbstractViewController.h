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
@class AKIModel;

@interface AKIAbstractViewController : UIViewController <AKIObservableModel>
@property (nonatomic, strong)   AKIModel        *model;

@end
