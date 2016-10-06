//
//  AKIInternetImageModel.h
//  iOSProject
//
//  Created by Alexey Khomych on 04.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKILocalImageModel.h"

typedef void (^AKICompletionHandler)(NSURL *location, NSURLResponse *response, NSError *error);

@interface AKIInternetImageModel : AKILocalImageModel

@end
