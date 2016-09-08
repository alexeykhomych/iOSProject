//
//  AKIUsersViewController.m
//  iOSProject
//
//  Created by Alexey Khomych on 27.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIUsersViewController.h"

#import "UINib+AKIExtensions.h"

#import "UITableView+AKIExtensions.h"

#import "AKIUser.h"
#import "AKIUserCell.h"
#import "AKIUserView.h"

#import "AKIMacro.h"

#import "AKIArrayModel.h"
#import "AKIArrayChangeModel.h"

#import "AKIGCD.h"

AKIViewControllerBaseViewProperty(AKIUsersViewController, userView, AKIUserView)

@implementation AKIUsersViewController

#pragma mark -
#pragma mark Accessors

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setModel:(AKIUsersArrayModel *)model {
    if (_model != model) {
        [_model removeObserver:self];
        
        _model = model;
//        _filteredModel = model;
        
        [_model addObserver:self];
    }
}

//- (AKIUsersArrayModel *)model {
//    return self.userView.editingSearchBar && self.filteredModel ? self.filteredModel : self.model;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.model.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellClass = NSStringFromClass([AKIUserCell class]);
    
    AKIUserCell *cell = [tableView dequeueReusableCellWithIdentifier:cellClass];
    if (!cell) {
        UINib *nib = [UINib nibWithClass:[AKIUserCell class]];
        NSArray *cells = [nib instantiateWithOwner:nil options:nil];
        cell = [cells firstObject];
    }
    
    AKIUser *user = [self.model objectAtIndexedSubscript:indexPath.row];
    cell.textLabel.text = user.fullName;

    return cell;
}

- (void)    tableView:(UITableView *)tableView
   commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    AKIAsyncPerformInBackground(^{
        if (editingStyle == UITableViewCellEditingStyleDelete) {
            [self.model removeObjectAtIndex:indexPath.row];
        } else if (editingStyle == UITableViewCellEditingStyleInsert) {
            [self.model addObject:[AKIUser new]];
        }
    });
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
          toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.model moveObjectAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onAddButton:(id)sender {
    [self addModel:[AKIUser new]];
}

- (IBAction)onEditButton:(id)sender {
    [self.userView setEditing:!self.userView.editing];
}

#pragma mark -
#pragma mark Public

- (void)addModel:(id)model {
    [self.model addObject:model];
}

#pragma mark -
#pragma mark Notifications

- (void)arrayModel:(AKIArrayModel *)arrayModel didUpdateWithChangeModel:(AKIArrayChangeModel *)arrayChangeModel {
    AKIPrintMethod
    
//    AKIWeakify(self);
//    
//    AKIAsyncPerformInMainQueue(^{
//        AKIStrongifyAndReturnIfNil(self);
        [self.userView.tableView updateWithBlock:arrayChangeModel];
//    });
}

- (void)arrayModelDidLoad:(AKIArrayModel *)arrayModel {
    AKIPrintMethod
    
    AKIWeakify(self);
    AKIAsyncPerformInMainQueue(^{
        AKIStrongifyAndReturnIfNil(self);
        
    });
}

- (void)arrayModelDidFailLoading:(AKIArrayModel *)arrayModel {
    AKIPrintMethod
}

- (void)arrayModelWillLoad:(AKIArrayModel *)arrayModel {
    AKIPrintMethod
}

#pragma mark -
#pragma mark UISearchBar

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    AKIPrintMethod
    self.userView.editingSearchBar = YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    AKIPrintMethod
    self.userView.editingSearchBar = NO;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    AKIPrintMethod
    [self filterContentForSearchText:searchText];
}

//- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;                     // called when keyboard search button pressed
//- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar __TVOS_PROHIBITED; // called when bookmark button pressed
//- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar __TVOS_PROHIBITED;   // called when cancel button pressed
//- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar NS_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED; // called when search results button pressed
//
//- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope NS_AVAILABLE_IOS(3_0);

- (void)filterContentForSearchText:(NSString*)searchText {
//    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];
//    NSArray *result = [self.model.objects filteredArrayUsingPredicate:resultPredicate];
//    
//    [self.userView.tableView reloadData];
    AKIPrintMethod
}


@end
