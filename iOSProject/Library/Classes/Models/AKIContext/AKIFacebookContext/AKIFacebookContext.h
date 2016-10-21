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

@property (nonatomic, readonly)       NSFileManager   *fileManager;
@property (nonatomic, readonly, copy) NSString        *documentsPath;
@property (nonatomic, readonly, copy) NSString        *filePath;
@property (nonatomic, readonly)       BOOL            cached;
@property (nonatomic, readonly, copy) NSString        *fileName;

- (void)parseData:(id)result;
- (void)removeCachedModel;
- (void)archiveModel:(id)model;

//override in children
- (id)completionHandler;

- (void)save;
- (void)load;

- (void)loadModel:(id)model;

@end
