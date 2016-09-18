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

#import "AKIFilteredArrayModel.h"

AKIViewControllerBaseViewProperty(AKIUsersViewController, AKIUserView, userView)

@interface AKIUsersViewController ()
@property (nonatomic, strong) AKIFilteredArrayModel *filteredModel;

@end

@implementation AKIUsersViewController

@synthesize model = _model;

#pragma mark -
#pragma mark Accessors

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setModel:(id)model {
    if (_model != model) {
        [_model removeObserver:self];
        
        _model = model;
        
        [_model addObserver:self];
        
        [self addModelToFilter:model];
    }
}

- (void)addModelToFilter:(id)model {
    self.filteredModel = [[AKIFilteredArrayModel alloc] init];
    [self.filteredModel addModelToFilter:model];
    [self.filteredModel addObserver:self];
}

- (AKIArrayModel *)model {
    return self.filteredModel;
}

- (void)filterContentForSearchText:(NSString*)searchText {
    AKIPrintMethod
    [self.filteredModel filterUsingString:searchText];
    
    [self.userView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.model.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AKIUserCell *cell = [tableView cellWithClass:[AKIUserCell class]];
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
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    AKIPrintMethod
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    AKIPrintMethod
    [self filterContentForSearchText:searchText];
}



@end
