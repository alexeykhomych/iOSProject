//
//  AKIUsersArrayModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 02.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIUsersArrayModel.h"

#import "AKIUser.h"

#import "AKIGCD.h"

#import "NSObject+AKIExtensions.h"

#import "AKIMacro.h"

AKIConstant(NSUInteger, UsersCount, 10);
AKIStringConstant(FileName, @"UsersArrayModel.plist");

@interface AKIUsersArrayModel ()
@property (nonatomic, readonly)             NSFileManager   *fileManager;
@property (nonatomic, readonly, copy)       NSString        *documentsPath;
@property (nonatomic, readonly, copy)       NSString        *path;
@property (nonatomic, readonly)             BOOL            cached;

@property (nonatomic, strong)   id          observer;
@property (nonatomic, readonly) NSArray     *appNotifications;

- (void)startObservingForName:(NSString *)name withBlock:(void(^)(void))block;
- (void)stopObservingForName:(NSString *)name;

- (void)startObservingForNames:(NSArray *)names withBlock:(void(^)(void))block;
- (void)stopObservingForNames:(NSArray *)names;

@end

@implementation AKIUsersArrayModel

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self stopObservingForNames:self.appNotifications];
}

- (instancetype)init {
    self = [super init];
    
    id block = ^{
        [self save];
    };
    
    [self startObservingForNames:self.appNotifications withBlock:block];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSFileManager *)fileManager {
    return [NSFileManager defaultManager];
}

- (NSString *)documentsPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSString *)path {
    return [self.documentsPath stringByAppendingPathComponent:kAKIFileName];
}

- (BOOL)cached {
    return [self.fileManager fileExistsAtPath:self.path];
}

- (NSArray *)appNotifications {
    return @[UIApplicationWillTerminateNotification, UIApplicationDidEnterBackgroundNotification];
}

#pragma mark -
#pragma mark Public

- (void)save {
    [self.fileManager createFileAtPath:self.path contents:nil attributes:nil];
    [NSKeyedArchiver archiveRootObject:self.objects toFile:self.path];
}

- (void)performLoading {
    [self performBlockWithoutNotification:^{
        id model = nil;
        
        if (!self.cached) {
            model = [AKIUser objectsWithCount:kAKIUsersCount];
        } else {
            model = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
        }
        
        [self addObjects:model];
    }];
    
    self.state = AKIModelDidLoad;
}

#pragma mark -
#pragma mark Privat

- (void)startObservingForName:(NSString *)name withBlock:(void(^)(void))block {
    self.observer = [[NSNotificationCenter defaultCenter] addObserverForName:name
                                        object:nil
                                         queue:nil
                                    usingBlock:^(NSNotification *note){
                                        AKIPerformBlock(block);
                                    }];
}

- (void)stopObservingForName:(NSString *)name {
    [[NSNotificationCenter defaultCenter] removeObserver:self.observer name:name object:nil];
}

- (void)startObservingForNames:(NSArray *)names withBlock:(void(^)(void))block {
    for (NSString *name in names) {
        [self startObservingForName:name withBlock:block];
    }
}

- (void)stopObservingForNames:(NSArray *)names {
    for (NSString *name in names) {
        [self stopObservingForName:name];
    }
}

@end
 