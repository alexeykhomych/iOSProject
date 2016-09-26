//
//  AKIManagedViewController.m
//  iOSProject
//
//  Created by Alexey Khomych on 26.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIManagedViewController.h"

#import "AKIManagedView.h"

#import "AKIMacro.h"

//AKIViewControllerBaseViewProperty(AKIManagedViewController, AKIManagedView, managedView)

@implementation AKIManagedViewController

//@dynamic managedView;

- (AKIManagedView *)managedView { \
    if ([self isViewLoaded] && [self.view isKindOfClass:[AKIManagedView class]]) { \
        return (AKIManagedView *)self.view; \
    } \
    \
    return nil; \
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.managedView.model = self.model;
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
