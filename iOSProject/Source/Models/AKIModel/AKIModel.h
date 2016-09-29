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
    AKIModelDidFailLoading,
    AKIModelStateCount
};

@protocol AKIObservableModel <NSObject>

- (void)modelDidUpdate:(id)model;
- (void)modelWillLoad:(id)model;
- (void)modelDidLoad:(id)model;
- (void)modelDidFailLoading:(id)model;

@end

@interface AKIModel : AKIObservableObject

- (void)load;

@end
