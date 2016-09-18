//
//  AKIUsersArrayModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 02.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIUsersArrayModel.h"

#import "AKIUser.h"

#import "AKIMacro.h"

#import "AKIGCD.h"

AKIConstant(NSUInteger, UsersCount, 10);

@interface AKIUsersArrayModel ()

- (void)fillModel;

@end

@implementation AKIUsersArrayModel

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    [self fillModel];
    
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

#define kAKIFileName @"UsersArrayModel.plist"

- (NSString *)path {
    return [self.documentsPath stringByAppendingPathComponent:kAKIFileName];
}

#pragma mark -
#pragma mark Public

- (void)save {
    @synchronized (self) {
        [NSKeyedArchiver archiveRootObject:self.objects toFile:self.path] ? NSLog(@"Succesfull saved file") : NSLog(@"Failed save file");
    }
}

- (void)load {
    @synchronized (self) {
        AKIAsyncPerformInBackground(^{            
            if (![self.fileManager fileExistsAtPath:self.path]) {
                [self.fileManager createFileAtPath:self.path contents:nil attributes:nil];
                [self fillModel];
                [self save];
            } else {
                [self load];
            }
            
            self.state = AKIArrayModelWillLoad;
            
            [self performBlockWithoutNotification:^{
                [self removeAllObjects];
                [self addObjects:[NSKeyedUnarchiver unarchiveObjectWithFile:self.path]];
            }];
            
            self.state = AKIArrayModelDidLoad;
            
            [self notifyOfState:self.state withObject:self.objects];
        });
    }
}

#pragma mark -
#pragma mark Privat

- (void)fillModel {
    [self performBlockWithoutNotification:^{
        for (NSUInteger i = 0; i < kAKIUsersCount; i++) {
            [self addObject:[AKIUser new]];
        }
    }];
}

@end
