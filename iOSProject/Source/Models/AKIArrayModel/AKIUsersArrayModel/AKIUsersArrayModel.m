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
#import "NSFileManager+AKIExtensions.h"

#import "AKIMacro.h"

AKIConstant(NSUInteger, UsersCount, 10);
AKIStringConstant(FileName, @"UsersArrayModel.plist");

@interface AKIUsersArrayModel ()
@property (nonatomic, readonly)             NSFileManager   *fileManager;
@property (nonatomic, readonly, copy)       NSString        *documentsPath;
@property (nonatomic, readonly, copy)       NSString        *path;
@property (nonatomic, readonly)             BOOL            cached;

@property (nonatomic, strong)       NSMutableDictionary     *observerDictionary;
@property (nonatomic, readonly)     NSArray                 *appNotifications;

- (void)startObservingNotificationName:(NSString *)name withBlock:(AKIVoidBlock)block;
- (void)stopObservingNotificationName:(NSString *)name;

- (void)startObservingNotificationNames:(NSArray *)names withBlock:(AKIVoidBlock)block;
- (void)stopObservingNotificationNames:(NSArray *)names;

@end

@implementation AKIUsersArrayModel

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self stopObservingNotificationNames:self.appNotifications];
}

- (instancetype)init {
    self = [super init];
    
    id block = ^{
        [self save];
    };
    
    self.observerDictionary = [NSMutableDictionary new];
    
    [self startObservingNotificationNames:self.appNotifications withBlock:block];
    
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

//- (NSArray *)appNotifications {
//    return @[UIApplicationWillTerminateNotification, UIApplicationDidEnterBackgroundNotification];
//}

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

- (void)startObservingNotificationNames:(NSArray *)names withBlock:(AKIVoidBlock)block {
    for (NSString *name in names) {
        [self startObservingNotificationName:name withBlock:block];
    }
}

- (void)startObservingNotificationName:(NSString *)name withBlock:(AKIVoidBlock)block {
    id observer = [[NSNotificationCenter defaultCenter] addObserverForName:name
                                                                    object:nil
                                                                     queue:nil
                                                                usingBlock:^(NSNotification *note){
                                                                    AKIPerformBlock(block);
                                                                }];
    
    [self.observerDictionary setObject:observer forKey:name];
}

- (void)stopObservingNotificationNames:(NSArray *)names {
    for (NSString *name in names) {
        [self stopObservingNotificationName:name];
    }
}

- (void)stopObservingNotificationName:(NSString *)name {
    [[NSNotificationCenter defaultCenter] removeObserver:[self.observerDictionary objectForKey:name] name:name object:nil];
}

@end
 