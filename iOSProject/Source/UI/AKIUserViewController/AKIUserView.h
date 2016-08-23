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
    AKIPositionDefault,
    AKIPositionTopLeft,
    AKIPositionTopRight,
    AKIPositionBottomRight,
    AKIPositionBottomLeft,
    AKIPositionCount
} AKIPosition;

@interface AKIUserView : UIView
@property (nonatomic, strong)   IBOutlet UILabel             *label;
@property (nonatomic, strong)   IBOutlet UIButton            *start;
@property (nonatomic, strong)   IBOutlet UIButton            *stop;

@property (nonatomic, readonly, getter=isRunnning) BOOL running;

@property (nonatomic, assign)   AKIPosition squarePosition;
- (void)setSquarePosition:(AKIPosition)squarePosition
                 animated:(BOOL)animated;

- (void)setSquarePosition:(AKIPosition)squarePosition
                 animated:(BOOL)animated
        completionHandler:(AKICompletionHandler)completionHandler;

- (void)startAnimation;
- (void)stopAnimation;

@end
