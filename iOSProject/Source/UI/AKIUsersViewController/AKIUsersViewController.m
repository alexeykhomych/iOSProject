//
//  AKIUsersViewController.m
//  iOSProject
//
//  Created by Alexey Khomych on 27.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIUsersViewController.h"

#import "AKIUser.h"
#import "AKIUserCell.h"
#import "AKIUserView.h"
#import "AKIFilteredUsersArrayModel.h"

#import "AKIArrayModel.h"
#import "AKIArrayChangeModel.h"

#import "AKIGCD.h"

#import "AKILoadingViewContainer.h"

#import "NSBundle+AKIExtensions.h"
#import "UINib+AKIExtensions.h"
#import "UITableView+AKIExtensions.h"

#import "AKIMacro.h"

AKIViewControllerBaseViewProperty(AKIUsersViewController, AKIUserView, userView)

@interface AKIUsersViewController ()
@property (nonatomic, strong)   AKIFilteredUsersArrayModel      *filteredModel;
@property (nonatomic, readonly) AKIArrayModel                   *dataSource;

@property (nonatomic, assign) BOOL  searching;

@end

@implementation AKIUsersViewController

@dynamic dataSource;
@dynamic model;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.model = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setModel:(AKIUsersArrayModel *)model {
    if ([super model] != model) {
        [super setModel:model];
        
        self.filteredModel = [[AKIFilteredUsersArrayModel alloc] initWithModel:model];
    }
}

- (void)filterContentForSearchText:(NSString*)searchText {
    AKIPrintMethod
    AKIFilteredUsersArrayModel *filteredModel = self.filteredModel;
    
    filteredModel.filter = searchText;
    [filteredModel filterObjects];
    
    self.filteredModel = filteredModel;
    
    [self.userView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (AKIArrayModel *)dataSource {
    return self.searching ? self.filteredModel : self.model;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AKIUserCell *cell = [tableView cellWithClass:[AKIUserCell class]];
    cell.user = self.dataSource[indexPath.row];
    
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

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
          toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.model moveObjectAtIndex:[self.model indexOfObject:self.dataSource[sourceIndexPath.row]] toIndex:destinationIndexPath.row];
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)    tableView:(UITableView *)tableView
 didEndDisplayingCell:(AKIUserCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.user = nil;
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
    
    AKIWeakify(self);

    AKIAsyncPerformInMainQueue(^{
        AKIStrongifyAndReturnIfNil(self);
        [self.userView.tableView updateWithChangeModel:arrayChangeModel];
    });
}

- (void)arrayModelDidLoad:(AKIArrayModel *)arrayModel {
    AKIPrintMethod
    
    AKIWeakify(self);
    AKIAsyncPerformInMainQueue(^{
        AKIStrongifyAndReturnIfNil(self);
       [self.userView.tableView reloadData];
    });
}

#pragma mark -
#pragma mark UISearchBar

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    AKIPrintMethod
    self.searching = YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    AKIPrintMethod
    self.searching = NO;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    AKIPrintMethod
    [self filterContentForSearchText:searchText];
}

@end
