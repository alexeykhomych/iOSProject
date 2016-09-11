//
//  AKIFilteredUsersArrayModel.h
//  iOSProject
//
//  Created by Alexey Khomych on 11.09.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIUsersArrayModel.h"

@interface AKIFilteredUsersArrayModel : AKIUsersArrayModel

- (void)filteredModel:(AKIUsersArrayModel *)model usingString:(NSString *)searchText;

@end
