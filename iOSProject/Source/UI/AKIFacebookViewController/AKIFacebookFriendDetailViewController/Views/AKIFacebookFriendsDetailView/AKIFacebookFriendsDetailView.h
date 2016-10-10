//
//  AKIFacebookFriendsDetailView.h
//  iOSProject
//
//  Created by Alexey Khomych on 10.10.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKILoadingViewContainer.h"

@interface AKIFacebookFriendsDetailView : AKILoadingViewContainer
@property (nonatomic, strong) IBOutlet UIImageView  *imageView;

@property (nonatomic, strong) IBOutlet UILabel      *friendName;
@property (nonatomic, strong) IBOutlet UILabel      *city;
@property (nonatomic, strong) IBOutlet UILabel      *birthday;

@end
