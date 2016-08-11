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

#import "AKIMacro.h"

AKIViewControllerBaseViewProperty(AKIUserViewController, userView, AKIUserView)

@implementation AKIUserViewController

#pragma mark -
#pragma mark Accessors

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.userView.tableView reloadData];
    
//    [tableView addObserver:self forKeyPath:@"bounds" options:NSKeyValueObservingOptionNew context:NULL];
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
//    CGRect bounds = self.userView.tableView.bounds;
//    
//    NSLog(@"%@", [NSValue valueWithCGRect:bounds]);
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellClass = NSStringFromClass([AKIUserCell class]);
    
    AKIUserCell *cell = [tableView dequeueReusableCellWithIdentifier:cellClass];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:cellClass bundle:nil];
        NSArray *cells = [nib instantiateWithOwner:nil options:nil];
        cell = [cells firstObject];
    }
    
    NSArray *data = cell.data;
    for (id object in data) {
        cell.user = object;
        
        break;
    }
    
    return cell;
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
