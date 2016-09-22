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

static NSString * const kAKIFileName = @"UsersArrayModel.plist";

@interface AKIUsersArrayModel ()
@property (nonatomic, readonly)             NSFileManager   *fileManager;
@property (nonatomic, readonly, copy)       NSString        *documentsPath;
@property (nonatomic, readonly, copy)       NSString        *path;
@property (nonatomic, readonly)             BOOL            cached;

- (BOOL)shouldNotify:(AKIArrayModelState)state;

@end

@implementation AKIUsersArrayModel

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

#pragma mark -
#pragma mark Public

- (void)save {
    [self.fileManager createFileAtPath:self.path contents:nil attributes:nil];
    BOOL success = [NSKeyedArchiver archiveRootObject:self.objects toFile:self.path];
    NSLog(success ? @"Succesfull saved file" : @"Failed save file");
}

- (void)load {
    @synchronized (self) {
        AKIArrayModelState state = self.state;
        
        if (state == AKIArrayModelWillLoad) {
            return;
        }
        
        if (state == AKIArrayModelDidLoad) {
            [self notifyOfState:state];
            
            return;
        }
        
        self.state = AKIArrayModelWillLoad;
        
        AKIAsyncPerformInBackground(^{
            [self performBlockWithoutNotification:^{
                id model = nil;
                
                if (!self.cached) {
                    model = [AKIUser objectsWithCount:kAKIUsersCount];
                } else {
                    model = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
                }
                
                [self addObjects:model];
            }];
            
            self.state = AKIArrayModelDidLoad;
        });
    }
}

@end
 