//
//  AKILoadingViewContainer.h
//  iOSProject
//
//  Created by Alexey Khomych on 22.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIModel.h"

#import "AKIView.h"

@interface AKILoadingViewContainer : AKIView <AKIModelObserver>
@property (nonatomic, strong) AKIModel *model;

@end
