//
//  AKIKvo.h
//  iOSProject
//
//  Created by Alexey Khomych on 12.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKIKvo : NSObject

- (void)addObserver:(NSObject *)anObserver
         forKeyPath:(NSString *)keyPath
            options:(NSKeyValueObservingOptions)options
            context:(void *)context;

- (void)removeObserver:(NSObject *)anObserver
            forKeyPath:(NSString *)keyPath;

- (void)removeObserver:(NSObject *)observer
            forKeyPath:(NSString *)keyPath
               context:(void *)context;

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context;

@end
