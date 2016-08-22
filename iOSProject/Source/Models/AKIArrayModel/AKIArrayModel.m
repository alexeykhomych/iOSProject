//
//  AKIArrayModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 21.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayModel.h"

#import "NSString+AKIExtensions.h"

static NSUInteger const kAKIUserCount = 10;

@implementation AKIArrayModel

#pragma mark -
#pragma mark Class methods

+ (id)randomDataArray:(NSUInteger)count {
    NSMutableArray *data = [NSMutableArray new];
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            for (NSUInteger i = 0; i < kAKIUserCount; i++) {
                [data addObject:[NSString fullName]];
            }
        });
    });
    
    NSLog(@"Done");
    
    return data;
}


@end
