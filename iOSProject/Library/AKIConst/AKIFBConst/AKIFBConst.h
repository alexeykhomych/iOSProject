//
//  AKIFBConst.h
//  iOSProject
//
//  Created by Alexey Khomych on 12.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIMacro.h"

#pragma mark -
#pragma mark Permissions

AKIFBStringConstant(LoginPermissions, @"public_profile");
AKIFBStringConstant(Data, @"data");
AKIFBStringConstant(ID, @"id");
AKIFBStringConstant(Name, @"name");
AKIFBStringConstant(Picture, @"picture");
AKIFBStringConstant(URL, @"url");

#pragma mark -
#pragma mark Request type

AKIFBStringConstant(GET, @"GET");
AKIFBStringConstant(POST, @"POST");
AKIFBStringConstant(PUT, @"PUT");
AKIFBStringConstant(DELETE, @"DELETE");

#pragma mark -
#pragma mark Path

AKIFBStringConstant(FriendsRequest, @"/friends");
AKIFBStringConstant(Me, @"/me");
