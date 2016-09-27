//
//  AKILoadingViewContainerController.m
//  iOSProject
//
//  Created by Alexey Khomych on 26.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKISuperViewController.h"

#import "AKILoadingViewContainer.h"

#import "AKIMacro.h"

@implementation AKISuperViewController

AKIBaseViewGetterSynthesize(AKILoadingViewContainer, container)

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.container.model = self.model;
    [self.model load];
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

@end
