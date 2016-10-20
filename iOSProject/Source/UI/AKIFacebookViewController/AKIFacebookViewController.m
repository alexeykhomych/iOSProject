//
//  AKIFacebookViewController.m
//  iOSProject
//
//  Created by Alexey Khomych on 17.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFacebookViewController.h"

#import "AKIUser.h"

@implementation AKIFacebookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Accessors

- (void)setContext:(id)context {
    if (_context != context) {
        [_context removeObserver:self];
        
        _context = context;
        
        [_context addObserver:self];
    }
}

- (void)setUser:(AKIUser *)user {
    if (_user != user) {
        [_user removeObserver:self];
        
        _user = user;
        
        [_user addObserver:self];
    }
}

#pragma mark -
#pragma mark Public

- (void)loadContext {
    
}

@end
