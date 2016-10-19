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

#import "NSFileManager+AKIExtensions.h"

#import "AKIMacro.h"

AKIStringConstant(FileName, @"AKIContextModel.plist");

@interface AKIFacebookContext ()
@property (nonatomic, readonly)             NSFileManager   *fileManager;
@property (nonatomic, readonly, copy)       NSString        *documentsPath;
@property (nonatomic, readonly, copy)       NSString        *filePath;
@property (nonatomic, readonly)             BOOL            cached;

- (void)parseData:(id)result;

@end

@implementation AKIFacebookContext

#pragma mark -
#pragma mark Accessors

- (NSString *)path {
    return nil;
}

- (id)completionHandler {
    return ^(FBSDKGraphRequestConnection *connection, NSDictionary *result, NSError *error) {
        if (error) {
            AKIArrayModel *model = self.model;
            model.state = AKIModelDidFailLoading;
            
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
    return [self.fileManager fileExistsAtPath:self.path];
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
//            [self load];
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
    [self.fileManager createFileAtPath:self.filePath contents:nil attributes:nil];
    [NSKeyedArchiver archiveRootObject:self.model toFile:self.filePath];
}

- (void)load {
    id model = nil;
    
    if (!self.cached) {
        [self performExecute];
        NSLog(@"model will load from Internet");
        
        return;
    } else {
        model = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
        NSLog(@"model will load from file %@", kAKIFileName);
    }
    
    [self performBlockWithoutNotification:^{
        [self.model addObjects:model];
    }];
    
    self.state = AKIModelDidLoad;
}

@end
