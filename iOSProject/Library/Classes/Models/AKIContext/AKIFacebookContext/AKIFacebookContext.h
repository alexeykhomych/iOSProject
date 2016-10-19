//
//  AKIFacebookContext.h
//  iOSProject
//
//  Created by Alexey Khomych on 13.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIContext.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "AKIFBConst.h"

@interface AKIFacebookContext : AKIContext
@property (nonatomic, readonly) NSString            *path;
@property (nonatomic, readonly) NSDictionary        *parameters;
@property (nonatomic, readonly) NSString            *requestType;
@property (nonatomic, readonly) FBSDKGraphRequest   *request;

//override in children
- (id)completionHandler;

- (void)save;
- (void)load;

@end
