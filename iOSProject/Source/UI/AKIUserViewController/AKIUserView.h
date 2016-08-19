//
//  AKIUserView.h
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AKICompletionHandler)(void);

typedef enum {
    AKIPositionTopLeft,
    AKIPositionTopRight,
    AKIPositionButtomRight,
    AKIPositionButtomLeft,
    AKIPositionCount
} AKIPosition;

@interface AKIUserView : UIView
@property (nonatomic, strong)   IBOutlet UILabel             *label;
@property (nonatomic, strong)   IBOutlet UIButton            *start;
@property (nonatomic, strong)   IBOutlet UIButton            *stop;

@property (nonatomic, readonly) BOOL running;

@property (nonatomic, readonly)   AKIPosition squarePosition;

- (void)startAnimation;
- (void)stopAnimation;

@end
