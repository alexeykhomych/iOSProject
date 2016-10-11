//
//  AKIFriendsContext.m
//  iOSProject
//
//  Created by Alexey Khomych on 10.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFriendsContext.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>

@implementation AKIFriendsContext

#pragma mark -
#pragma mark Public

- (void)execute {
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:@"/me/friends"
                                  parameters:nil
                                  HTTPMethod:@"GET"];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        if (error) {
            return;
        }
        
        NSArray *items = [(NSDictionary *)result objectForKey:@"data"];
        AKIArrayModel *model = [AKIArrayModel new];
        
        for (int i=0; i< items.count; i++) {
            [model addObject:[items objectAtIndex:i]];
        }
        
        self.model = model;
    }];
}

@end
