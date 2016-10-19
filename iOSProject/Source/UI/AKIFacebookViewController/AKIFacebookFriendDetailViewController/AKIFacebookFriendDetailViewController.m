//
//  AKIFacebookFriendDetailViewController.m
//  iOSProject
//
//  Created by Alexey Khomych on 09.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFacebookFriendDetailViewController.h"

#import "AKIFacebookFriendsDetailView.h"

#import "AKIFriendDetailContext.h"

#import "AKIGCD.h"

#import "AKIMacro.h"

AKIViewControllerBaseViewProperty(AKIFacebookFriendDetailViewController, AKIFacebookFriendsDetailView, detailView)

@interface AKIFacebookFriendDetailViewController ()

- (void)loadCachedData;

@end

@implementation AKIFacebookFriendDetailViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadContext];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Observing

- (void)modelDidLoad:(AKIUser *)user {
    AKIWeakify(self);
    AKIAsyncPerformInMainQueue(^{
        AKIStrongifyAndReturnIfNil(self);
        self.detailView.user = self.user;
    });
}

- (void)modelDidFailLoading:(AKIUser *)user {
    [self loadCachedData];
}

#pragma mark -
#pragma mark Private

- (void)loadContext {
    AKIFriendDetailContext *context = [AKIFriendDetailContext new];
    context.model = self.user;
    
    self.context = context;
    
    [context execute];
}

- (void)loadCachedData {
    
}

@end
