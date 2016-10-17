//
//  AKIFacebookContext.h
//  iOSProject
//
//  Created by Alexey Khomych on 13.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIContext.h"

@interface AKIFacebookContext : AKIContext
@property (nonatomic, readonly) NSString        *path;
@property (nonatomic, readonly) id              request;

//override in children
- (id)completionHandler;

@end
