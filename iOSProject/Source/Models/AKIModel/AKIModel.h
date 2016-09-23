//
//  AKIModel.h
//  iOSProject
//
//  Created by Alexey Khomych on 21.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIObservableObject.h"

typedef NS_ENUM(NSUInteger, AKIModelState) {
    AKIModelUpdated,
    AKIModelDidLoad,
    AKIModelWillLoad,
    AKIModelFailedLoading
};

@protocol AKIObservableModel <NSObject>

- (void)modelDidUpdated;
- (void)modelWillLoad;
- (void)modelDidLoad;
- (void)modelFailedLoading;

@end

@interface AKIModel : AKIObservableObject

- (void)load;
- (void)performLoading;
- (BOOL)shouldNotifyObserver:(AKIModelState)state;

@end
