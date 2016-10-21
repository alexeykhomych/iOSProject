//
//  AKIFriendDetailContext.m
//  iOSProject
//
//  Created by Alexey Khomych on 17.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIFriendDetailContext.h"

#import "AKIUser.h"

@implementation AKIFriendDetailContext

#pragma mark -
#pragma mark Accessors

- (NSDictionary *)parameters {
    return @{ kAKIFBFields : [NSString stringWithFormat: @"%@,%@,%@,%@",
                                                            kAKIFBBirthday,
                                                            kAKIFBHometown,
                                                            kAKIFBEMail,
                                                            kAKIFBLargePicture],};
}

- (NSString *)path {
    return [NSString stringWithFormat:@"/%@", ((AKIUser *)self.model).ID];
}

#pragma mark -
#pragma mark Private

- (void)parseData:(NSDictionary *)data {
    AKIUser *user = self.model;
    
    NSDictionary *picture = data[kAKIFBPicture];
    NSDictionary *data2 = picture[kAKIFBData];
    
    user.url = [NSURL URLWithString:data2[kAKIFBURL]];
    
    user.state = AKIModelDidLoad;
}

- (void)loadModel:(id)model {
    AKIUser *user = self.model;

    user.state = AKIModelDidLoad;
}

@end
