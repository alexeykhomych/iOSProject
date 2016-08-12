//
//  AKIKvo.m
//  iOSProject
//
//  Created by Alexey Khomych on 12.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIKvo.h"

@implementation AKIKvo

#pragma mark -
#pragma mark Public

- (void)addObserver:(NSObject *)anObserver
         forKeyPath:(NSString *)keyPath
            options:(NSKeyValueObservingOptions)options
            context:(void *)context
{
    [super addObserver:anObserver forKeyPath:keyPath options:options context:context];
}

- (void)removeObserver:(NSObject *)anObserver
            forKeyPath:(NSString *)keyPath
{
    [super removeObserver:anObserver forKeyPath:keyPath];
}

- (void)removeObserver:(NSObject *)observer
            forKeyPath:(NSString *)keyPath
               context:(void *)context
{
    [super removeObserver:observer forKeyPath:keyPath context:context];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    [super observeValueForKeyPath:keyPath
                         ofObject:object
                           change:change
                          context:context];
}


@end
