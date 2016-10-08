//
//  AKIAbstractViewController.m
//  iOSProject
//
//  Created by Alexey Khomych on 26.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIAbstractViewController.h"

#import "AKILoadingViewContainer.h"

#import "AKIMacro.h"

AKIViewControllerBaseViewProperty(AKIAbstractViewController, AKILoadingViewContainer, loadingViewContainer)

@implementation AKIAbstractViewController

#pragma mark -
#pragma mark View Life Cycle

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    AKIModel *model = self.model;
    
    self.loadingViewContainer.model = model;
    [model load];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(AKIModel *)model {
    if (_model != model) {
        [_model removeObserver:self];
        
        _model = model;
        
        [_model addObserver:self];
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
