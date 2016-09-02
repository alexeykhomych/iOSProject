//
//  AKIUsersArrayModel.h
//  iOSProject
//
//  Created by Alexey Khomych on 02.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIArrayModel.h"

@interface AKIUsersArrayModel : AKIArrayModel

- (void)save;
- (void)load;

- (void)fillModelWithCount:(NSUInteger)count;

@end
