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
    AKIPositionFirst,
    AKIPositionSecond,
    AKIPositionThird,
    AKIPositionFourth
} AKIPosition;

@interface AKIUserView : UIView
@property (nonatomic, strong)   IBOutlet UILabel             *label;
@property (nonatomic, strong)   IBOutlet UIButton            *button;
@property (nonatomic, strong)   IBOutlet UIButton            *start;
@property (nonatomic, strong)   IBOutlet UIButton            *stop;

@property (nonatomic, readonly, getter=isRunning) BOOL    run;

@property (nonatomic, assign)   AKIPosition                  squarePosition;

- (void)moveRouteLabel;

- (void)setSquarePosition;
- (void)setSquarePosition:(AKIPosition)squarePosition
                 animated:(BOOL)animated;

- (void)setSquarePosition:(AKIPosition)squarePosition
                 animated:(BOOL)animated
    withCompletionHandler:(AKICompletionHandler)completionHandler;

- (void)startAnimation;
- (void)stopAnimation;

@end
