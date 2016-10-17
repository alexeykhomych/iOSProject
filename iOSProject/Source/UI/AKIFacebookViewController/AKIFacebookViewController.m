//
//  AKIFacebookViewController.m
//  iOSProject
//
//  Created by Alexey Khomych on 17.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFacebookViewController.h"

#import "AKIUser.h"

@interface AKIFacebookViewController ()

@end

@implementation AKIFacebookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(AKIUser *)user {
    if (_user != user) {
        [_user removeObserver:self];
        _user = user;
        [_user addObserver:self];
    }
}

- (void)setContext:(id)context {
    if (_context != context) {
        [_context removeObserver:self];
        
        _context = context;
        
        [_context addObserver:self];
    }
}

@end
