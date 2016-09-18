//
//  AKIUsersArrayModel.h
//  iOSProject
//
//  Created by Alexey Khomych on 02.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayModel.h"

@interface AKIUsersArrayModel : AKIArrayModel
@property (nonatomic, readonly)             NSFileManager   *fileManager;
@property (nonatomic, readonly, copy)       NSString        *documentsPath;
@property (nonatomic, readonly, copy)       NSString        *path;
@property (nonatomic, readonly)             BOOL            cached;

- (void)save;
- (void)load;

@end
