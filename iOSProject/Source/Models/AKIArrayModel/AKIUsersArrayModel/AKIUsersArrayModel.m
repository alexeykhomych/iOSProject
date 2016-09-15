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
@property (nonatomic, strong)   NSFileManager   *fileManager;
@property (nonatomic, copy)     NSString        *documentsPath;
@property (nonatomic, copy)     NSString        *path;

- (void)fillModel;

@end

@implementation AKIUsersArrayModel

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    
    self.fileManager = [NSFileManager defaultManager];
    self.documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    self.path = [self.documentsPath stringByAppendingPathComponent:@"UsersArrayModel.plist"];
    
    if ([self.fileManager fileExistsAtPath:self.path]) {
        [self.fileManager createFileAtPath:self.path contents:nil attributes:nil];
    }
    
    [self fillModel];
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)save {
    @synchronized (self) {
        [NSKeyedArchiver archiveRootObject:self toFile:self.path] ? NSLog(@"Succesfull saved file") : NSLog(@"Failed save file");
    }
}

- (void)load {
    @synchronized (self) {
        [self removeAllObjects];
        
        /*self = */ [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
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
