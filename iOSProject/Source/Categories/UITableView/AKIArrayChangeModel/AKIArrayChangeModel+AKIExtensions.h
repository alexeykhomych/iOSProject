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

@interface AKIArrayChangeModel (AKIExtensions)

- (void)applyToTableView:(UITableView *)tableView;

@end

@interface AKIArrayChangeModelInsert (AKIExtensions)

@end

@interface AKIArrayChangeModelDelete (AKIExtensions)

@end

@interface AKIArrayChangeModelMove (AKIExtensions)

@end

