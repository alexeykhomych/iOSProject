//
//  NSString+AKIExtensions.h
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^dispatch_block_t)(void);

@interface NSString (AKIExtensions)

+ (NSString *)fullName;

@end
