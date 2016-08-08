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

@property (nonatomic, assign)   AKIPosition                  squarePosition;

- (void)moveRouteLabel;
- (SEL)nextPosition;

- (void)setSquarePosition;
- (void)setSquarePosition:(AKIPosition)squarePosition withAnimated:(BOOL)animated;
- (void)setSquarePosition:(AKIPosition)squarePosition withAnimated:(BOOL)animated withCompletionHandler:(AKICompletionHandler)completionHandler;

-(void)AKIPositionFirst;
-(void)AKIPositionSecond;
-(void)AKIPositionThird;
-(void)AKIPositionFourth;

- (void)startAnimation;
- (void)stopAnimation;

@end
