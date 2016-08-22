//
//  AKIUserViewController.m
//  iOSProject
//
//  Created by Alexey Khomych on 27.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIUserViewController.h"

#import "UINib+AKIExtensions.h"

#import "AKIUser.h"
#import "AKIUserCell.h"
#import "AKIUserView.h"

#import "AKIMacro.h"

#import "AKIArrayModel.h"

AKIViewControllerBaseViewProperty(AKIUserViewController, userView, AKIUserView)

@implementation AKIUserViewController

#pragma mark -
#pragma mark Accessors

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.users = [NSMutableArray arrayWithObjects:@"Tom", @"Bill", @"Tom", @"Joe", @"Tom", nil];
//    self.users = [AKIArrayModel randomDataArray:3];
    [self.userView.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellClass = NSStringFromClass([AKIUserCell class]);
    
    AKIUserCell *cell = [tableView dequeueReusableCellWithIdentifier:cellClass];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:cellClass bundle:nil];
        NSArray *cells = [nib instantiateWithOwner:nil options:nil];
        cell = [cells firstObject];
    }
    
    cell.textLabel.text = [self.users objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.users removeObjectAtIndex:indexPath.row];
        [self.userView.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        [self.users addObject:@"New field"];
        [self.userView.tableView reloadData];
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
    [self tableView:self.userView.tableView commitEditingStyle:UITableViewCellEditingStyleInsert
  forRowAtIndexPath:[self.userView.tableView indexPathForSelectedRow]];
}

- (IBAction)onRemoveField:(id)sender {
    NSIndexPath *indexPath = [self.userView.tableView indexPathForSelectedRow];
    
    if (!indexPath) {
        return;
    }
    
    [self tableView:self.userView.tableView commitEditingStyle:UITableViewCellEditingStyleDelete forRowAtIndexPath:indexPath];
}

- (IBAction)onSortTable:(id)sender {
    [self.userView setEditing:self.userView.editing animated:YES];
}

@end
