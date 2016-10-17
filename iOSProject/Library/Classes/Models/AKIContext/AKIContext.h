//
//  AKIContext.h
//  iOSProject
//
//  Created by Alexey Khomych on 10.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIObservableObject.h"

@interface AKIContext : AKIObservableObject
@property (nonatomic, strong) id model;

- (void)execute;
- (void)cancel;

@end
