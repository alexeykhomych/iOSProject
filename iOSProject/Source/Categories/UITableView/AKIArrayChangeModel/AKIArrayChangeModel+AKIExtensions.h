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

#define AKIInterfaceWithEmptyMethod(class, extensions) \
    @interface class (extensions) \
        - (void)applyToTableView:(id)tableView;\
    @end

AKIInterfaceWithEmptyMethod (AKIArrayChangeModel, UITableView)

AKIEmptyInterfaceWithExtensions (AKIArrayChangeModelInsert, UITableView)
AKIEmptyInterfaceWithExtensions (AKIArrayChangeModelDelete, UITableView)
AKIEmptyInterfaceWithExtensions (AKIArrayChangeModelMove, UITableView)
