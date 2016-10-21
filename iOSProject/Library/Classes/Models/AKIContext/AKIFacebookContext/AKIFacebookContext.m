//
//  AKIFacebookContext.m
//  iOSProject
//
//  Created by Alexey Khomych on 13.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFacebookContext.h"

#import "AKIGCD.h"

#import "AKIArrayModel.h"

#import "AKIUser.h"

#import "NSFileManager+AKIExtensions.h"

#import "AKIMacro.h"

AKIStringConstant(FileName, @"AKIUsersModel.plist");

@implementation AKIFacebookContext

#pragma mark -
#pragma mark Accessors

- (NSString *)path {
    return nil;
}

- (id)completionHandler {
    return ^(FBSDKGraphRequestConnection *connection, NSDictionary *result, NSError *error) {
        if (error) {
            [self load];
            
            return;
        }
        
        [self parseData:result];
    };
}

- (NSString *)parameters {
    return nil;
}

- (NSString *)requestType {
    return kAKIFBGET;
}

- (FBSDKGraphRequest *)request {
    return [[FBSDKGraphRequest alloc] initWithGraphPath:self.path
                                             parameters:self.parameters
                                             HTTPMethod:self.requestType];
}

- (NSFileManager *)fileManager {
    return [NSFileManager defaultManager];
}

- (NSString *)documentsPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSString *)filePath {
    return [self.documentsPath stringByAppendingPathComponent:kAKIFileName];
}

- (BOOL)cached {
    return [self.fileManager fileExistsAtPath:self.filePath];
}

- (NSString *)fileName {
    return kAKIFileName;
}

#pragma mark -
#pragma mark Public

- (void)execute {
    @synchronized (self) {
        AKIArrayModel *model = self.model;
        AKIModelState state = model.state;
        
        if ([self shouldNotifyObserver:state]) {
            [self notifyOfState:state];
            
            return;
        }
        
        model.state = AKIModelWillLoad;
        
        AKIAsyncPerformInBackground(^{
            [self performExecute];
        });
    }   
}

#pragma mark -
#pragma mark Private

- (void)parseData:(id)result {
    
}

- (void)performExecute {
    AKIWeakify(self);
    AKIAsyncPerformInMainQueue(^{
        AKIStrongifyAndReturnIfNil(self);
        [[self request] startWithCompletionHandler:[self completionHandler]];
    });
}

- (BOOL)shouldNotifyObserver:(AKIModelState)state {
    return AKIModelDidLoad == state || AKIModelWillLoad == state;
}

- (void)save {
    [self removeCachedModel];
    [self.fileManager createFileAtPath:self.filePath contents:nil attributes:nil];
    AKIArrayModel *model = self.model;
    [self archiveModel:model.objects];
}

- (void)archiveModel:(id)model {
    [NSKeyedArchiver archiveRootObject:model toFile:self.filePath];
    NSLog(@"model %@ added to cach", model);
}

- (void)load {
    id model = nil;
    
    if (!self.cached) {
        ((AKIArrayModel *)self.model).state = AKIModelDidFailLoading;
        
        return;
    }
    
    model = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
    NSLog(@"model will load from file %@", kAKIFileName);
    
    [self loadModel:model];
}

- (void)loadModel:(id)model {
    AKIArrayModel *friends = self.model;
    [friends performBlockWithoutNotification:^{
        [friends addObjects:model];
    }];
    
    friends.state = AKIModelDidLoad;
}

- (void)removeCachedModel {
    [self.fileManager removeItemAtPath:self.filePath  error:nil];
}

@end
