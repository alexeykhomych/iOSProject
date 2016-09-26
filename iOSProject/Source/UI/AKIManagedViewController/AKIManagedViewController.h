//
//  AKIManagedViewController.h
//  iOSProject
//
//  Created by Alexey Khomych on 26.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AKIModel.h" 

@class AKIManagedView;
@class AKIModel;

@interface AKIManagedViewController : UIViewController <AKIObservableModel>
@property (nonatomic, readonly) AKIManagedView  *managedView;
@property (nonatomic, strong)   AKIModel        *model;

@end
