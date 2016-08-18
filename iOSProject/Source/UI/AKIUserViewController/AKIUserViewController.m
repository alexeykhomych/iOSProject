//
//  AKIUserViewController.m
//  iOSProject
//
//  Created by Alexey Khomych on 27.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIUserViewController.h"


#import "AKIUser.h"
#import "AKIUserCell.h"
#import "AKIUserView.h"

#import "AKIMacro.h"

static NSUInteger const kAKINumberOfRows = 5;

AKIViewControllerBaseViewProperty(AKIUserViewController, userView, AKIUserView)

@implementation AKIUserViewController

#pragma mark -
#pragma mark Accessors

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.users = [NSMutableArray arrayWithObjects:@"Tom", @"Bill", @"Tom", @"Joe", @"Tom", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kAKINumberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellClass = NSStringFromClass([AKIUserCell class]);
    
    AKIUserCell *cell = [tableView dequeueReusableCellWithIdentifier:cellClass];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:cellClass bundle:nil];
        NSArray *cells = [nib instantiateWithOwner:nil options:nil];
        cell = [cells firstObject];
    }
    
    cell.user = self.user;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.users removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        [self.users insertObject:@"New field" atIndex:0];
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.users exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
}


#pragma mark -
#pragma mark UIButton

- (IBAction)onAddField:(id)sender {
    [self.userView addFieldWithRandomText];
    [self.userView.tableView reloadData];
}

- (IBAction)onRemoveField:(id)sender {
    [self.userView removeLastField];
    [self.userView.tableView reloadData];
}

- (IBAction)onSortTable:(id)sender {
    [self.userView sortTable];
    [self.userView.tableView reloadData];
}

@end
