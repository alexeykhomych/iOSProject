//
//  AKIFriendsContext.m
//  iOSProject
//
//  Created by Alexey Khomych on 10.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFriendsContext.h"

#import "AKIUser.h"

#import "AKIArrayModel.h"

@implementation AKIFriendsContext

#pragma mark -
#pragma mark Accessors

- (NSString *)path {
    return [NSString stringWithFormat:@"%@%@", kAKIFBMe, kAKIFBFriendsRequest];
}

- (NSDictionary *)parameters {
    return @{kAKIFBFields : [NSString stringWithFormat: @"%@,%@,%@", kAKIFBID, kAKIFBName, kAKIFBSmallPicture],};
}

#pragma mark -
#pragma mark Private

- (void)parseData:(NSDictionary *)data {
    AKIArrayModel *model = self.model;
    NSArray *friends = data[kAKIFBData];
    
    [model performBlockWithoutNotification:^{
        for (NSDictionary *friendsDictionary in friends) {
            AKIUser *friend = [AKIUser new];
            friend.ID = friendsDictionary[kAKIFBID];
            friend.name = friendsDictionary[kAKIFBName];
            
            NSDictionary *picture = friendsDictionary[kAKIFBPicture][kAKIFBData];
            friend.url = [NSURL URLWithString:picture[kAKIFBURL]];
            
            [model addObject:friend];
        }
    }];
    
    model.state = AKIModelDidLoad;
    
    [self save];
}

@end
