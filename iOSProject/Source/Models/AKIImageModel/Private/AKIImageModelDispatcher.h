//
//  AKIImageModelDispatcher.h
//  iOSProject
//
//  Created by Alexey Khomych on 16.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKIImageModelDispatcher : NSObject
@property (nonatomic, readonly) NSOperationQueue    *queue;

+ (instancetype)sharedDispatcher;

@end
