//
//  AKIAbstractViewController.m
//  iOSProject
//
//  Created by Alexey Khomych on 26.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIAbstractViewController.h"

#import "AKILoadingViewContainer.h"

#import "AKIArrayModel.h"

#import "AKIUser.h"

#import "AKIMacro.h"

AKIViewControllerBaseViewProperty(AKIAbstractViewController, AKILoadingViewContainer, loadingViewContainer)

@implementation AKIAbstractViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
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
#pragma mark Observation

- (void)modelDidLoad:(id)model {
    
}

- (void)modelDidUpdate:(id)model {
    
}

- (void)modelWillLoad:(id)model {
    
}

- (void)modelDidFailLoading:(id)model {
    
}

@end
