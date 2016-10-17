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
