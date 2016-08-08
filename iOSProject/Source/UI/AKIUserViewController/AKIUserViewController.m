//
//  AKIUserViewController.m
//  iOSProject
//
//  Created by Alexey Khomych on 27.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIUserViewController.h"

#import "AKIUserView.h"

#import "AKIMacro.h"

AKIViewControllerBaseViewProperty(AKIUserViewController, userView, AKIUserView)

@implementation AKIUserViewController

#pragma mark -
#pragma mark Accessors

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -
#pragma mark View Lifecycle

- (IBAction)onRandomRouteButton:(id)sender {
    
}

- (IBAction)onAutoRouteButton:(id)sender {
    [self.userView moveRouteLabel];
}

- (IBAction)onStartProcessingButton:(id)sender {
    [self.userView startAnimation];
}

- (IBAction)onStopProcessingButton:(id)sender {
    [self.userView stopAnimation];
}

@end
