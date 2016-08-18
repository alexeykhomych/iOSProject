//
//  AKIUserView.m
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIUserView.h"

#import <math.h>

static float const kAKIDuration = 3.0;
static float const kAKIDelay = 1.0;

@interface AKIUserView()
@property (nonatomic, readwrite) BOOL    running;

- (CGPoint)newPoint;
- (CGPoint)nextPosition:(AKIPosition)position;

@end

@implementation AKIUserView

#pragma mark -
#pragma mark Public

- (void)startAnimation {
    if (!self.running) {
        self.running = YES;
        [self setSquarePosition:self.squarePosition animated:YES];
    }
}

- (void)stopAnimation {
    self.running = NO;
}

#pragma mark -
#pragma mark Public

- (CGPoint)newPoint {
    CGRect viewBounds = [self bounds];
    CGRect labelBounds = [self.label bounds];
    
    float averageHeight = CGRectGetHeight(viewBounds) - CGRectGetHeight(labelBounds);
    float averageWidth = CGRectGetWidth(viewBounds) - CGRectGetWidth(labelBounds);
    
    return CGPointMake(averageWidth, averageHeight);
}

- (CGPoint)nextPosition:(AKIPosition)position {
    CGPoint point = CGPointMake(0, 0);
    CGPoint maxPoint = [self newPoint];
    
    switch (position) {
        case AKIPositionTopLeft:
            point.x = maxPoint.x;
            break;
            
        case AKIPositionTopRight:
            point = maxPoint;
            break;
            
        case AKIPositionDownRight:
            point.y = maxPoint.y;
            break;
            
        default:
            break;
    }
    
    return point;
}

- (void)setSquarePosition:(AKIPosition)squarePosition
                 animated:(BOOL)animated
{
    if (self.running) {
        [self setSquarePosition:squarePosition animated:animated withCompletionHandler:^{
            self.squarePosition = (self.squarePosition + 1) % AKIPositionCount;
            [self setSquarePosition:self.squarePosition animated:YES];
        }];
    }
}

- (void)setSquarePosition:(AKIPosition)squarePosition
                 animated:(BOOL)animated
    withCompletionHandler:(AKICompletionHandler)completionHandler
{
    [UIView animateWithDuration:kAKIDuration
                          delay:kAKIDelay
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         CGPoint point = [self nextPosition:squarePosition];
                         self.label.transform = CGAffineTransformMakeTranslation(point.x, point.y);
                     }
                     completion:^(BOOL finished) {
                         self.squarePosition = squarePosition;
                         if (completionHandler) {
                             completionHandler();
                         }
                     }];
}

@end
