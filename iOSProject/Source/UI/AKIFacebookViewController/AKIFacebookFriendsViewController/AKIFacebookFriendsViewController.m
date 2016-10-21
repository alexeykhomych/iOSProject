//
//  AKIFacebookFriendsViewController.m
//  iOSProject
//
//  Created by Alexey Khomych on 09.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFacebookFriendsViewController.h"

#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "AKIFacebookFriendsCell.h"

#import "AKIFacebookFriendsView.h"
#import "AKIFacebookFriendDetailViewController.h"

#import "AKIFriendsContext.h"

#import "AKIUser.h"

#import "AKIGCD.h"

#import "AKIArrayModel.h"

#import "UITableView+AKIExtensions.h"
#import "NSBundle+AKIExtensions.h"
#import "UINib+AKIExtensions.h"
#import "UITableView+AKIExtensions.h"

#import "AKIMacro.h"

AKIViewControllerBaseViewProperty(AKIFacebookFriendsViewController, AKIFacebookFriendsView, friendsView)

AKIStringConstant(Logout, @"Logout");

@interface AKIFacebookFriendsViewController ()

- (void)onLogout:(id)sender;

@end

@implementation AKIFacebookFriendsViewController

@synthesize model = _model;

#pragma mark -
#pragma mark Accessors

- (void)setModel:(AKIArrayModel *)model {
    if (_model != model) {
        [_model removeObserver:self];
        _model = model;
        [_model addObserver:self];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *logoutButton = [[UIBarButtonItem alloc] initWithTitle:kAKILogout
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(onLogout:)];
    
    [self.navigationItem setLeftBarButtonItem:logoutButton animated:YES];
    
    [self loadContext];
}

- (void)onLogout:(id)sender {
    [[FBSDKLoginManager new] logOut];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AKIFacebookFriendsCell *cell = [tableView cellWithClass:[AKIFacebookFriendsCell class]];
    cell.user = self.model[indexPath.row];
    
    return cell;
}

- (void)    tableView:(UITableView *)tableView
   commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.model removeObjectAtIndex:indexPath.row];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.model.count;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
          toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.model moveObjectAtIndex:[self.model indexOfObject:self.model[sourceIndexPath.row]]
                          toIndex:destinationIndexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AKIFacebookFriendsCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    AKIUser *user = cell.user;
    
    AKIFacebookFriendDetailViewController *controller = [AKIFacebookFriendDetailViewController new];
    controller.user = user;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)    tableView:(UITableView *)tableView
 didEndDisplayingCell:(AKIFacebookFriendsCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.user = nil;
}

#pragma mark -
#pragma mark Notifications

- (void)arrayModel:(AKIArrayModel *)arrayModel didUpdateWithChangeModel:(AKIArrayChangeModel *)arrayChangeModel {
    AKIWeakify(self);
    AKIAsyncPerformInMainQueue(^{
        AKIStrongifyAndReturnIfNil(self);
        [self.friendsView.tableView updateWithChangeModel:arrayChangeModel];
    });
}

- (void)modelDidLoad:(AKIArrayModel *)arrayModel {
    AKIWeakify(self);
    AKIAsyncPerformInMainQueue(^{
        AKIStrongifyAndReturnIfNil(self);
        self.friendsView.loadingViewVisible = NO;
        [self.friendsView.tableView reloadData];
    });
}

#pragma mark -
#pragma mark Private

- (void)loadContext {
    AKIFriendsContext *context = [AKIFriendsContext new];
    context.model = self.model;
    
    self.context = context;
    
    [context execute];
}

@end
