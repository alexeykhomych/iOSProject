//
//  AKIArrayChangeModel+AKIExtensions.h
//  iOSProject
//
//  Created by Alexey Khomych on 06.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayChangeModel.h"

#import "AKIArrayChangeModelInsert.h"
#import "AKIArrayChangeModelDelete.h"

#import "AKIArrayChangeModelMove.h"

#import "AKIMacro.h"

@interface AKIArrayChangeModel (UITableView)

- (void)applyToTableView:(UITableView *)tableView;

@end
