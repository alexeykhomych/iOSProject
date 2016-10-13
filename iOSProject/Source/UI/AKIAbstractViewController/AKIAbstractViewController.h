//
//  AKIAbstractViewController.h
//  iOSProject
//
//  Created by Alexey Khomych on 26.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AKIModel.h"

@class AKIArrayModel;
@class AKIUser;

@interface AKIAbstractViewController : UIViewController <AKIModelObserver>
@property (nonatomic, strong) AKIArrayModel *model;
@property (nonatomic, strong) AKIUser       *user;
@property (nonatomic, strong) id context;

- (void)loadContext;

@end
