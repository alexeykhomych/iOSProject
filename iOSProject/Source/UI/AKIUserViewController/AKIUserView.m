//
//  AKIUserView.m
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIUserView.h"

#import <math.h>

#import "AKIMacro.h"

static float const kAKIDuration = 3.0;
static float const kAKIDelay = 1.0;

@interface AKIUserView ()
@property (nonatomic, assign, getter=isAnimating)   BOOL    animating;
@property (nonatomic, assign)                       BOOL    shouldFinish;

- (CGPoint)viewSize;
- (CGPoint)nextPosition:(AKIPosition)position;
- (AKIPosition)nextPosition;

@end

@implementation AKIUserView

#pragma mark -
#pragma mark Public

- (void)startAnimation {
    if (!self.animating && !self.shouldFinish) {
        self.animating = YES;
        
        AKIWeakify(self);
        [self setSquarePosition:[self nextPosition] animated:YES completionHandler:^{
            AKIStrongifyAndReturn(self);
            self.animating = NO;
            [self startAnimation];
        }];
    }
}

- (void)stopAnimation {
    self.animating = NO;
    self.shouldFinish = YES;
}

- (void)setSquarePosition:(AKIPosition)squarePosition {
    [self setSquarePosition:squarePosition animated:YES];
}

- (void)setSquarePosition:(AKIPosition)squarePosition
                 animated:(BOOL)animated
{
    [self setSquarePosition:squarePosition animated:animated completionHandler:nil];
}

- (void)setSquarePosition:(AKIPosition)squarePosition
                 animated:(BOOL)animated
        completionHandler:(AKICompletionHandler)completionHandler
{
    [UIView animateWithDuration:animated ? kAKIDuration : 0
                          delay:kAKIDelay
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         CGRect frame = self.label.frame;
                         frame.origin = [self nextPosition:squarePosition];
                         self.label.frame = frame;
                     }
                     completion:^(BOOL shouldFinish) {
                         _squarePosition = squarePosition;
                         if (completionHandler) {
                             completionHandler();
                         }
                     }];
}

#pragma mark -
#pragma mark Private

- (AKIPosition)nextPosition {
    return (self.squarePosition + 1) % AKIPositionCount;
}

#define CGHeight CGRectGetHeight
#define CGWidth CGRectGetWidth

- (CGPoint)viewSize {
    CGRect viewBounds = [self bounds];
    CGRect labelBounds = [self.label bounds];
    
    CGFloat averageHeight = CGHeight(viewBounds) - CGHeight(labelBounds);
    CGFloat averageWidth = CGWidth(viewBounds) - CGWidth(labelBounds);
    
    return CGPointMake(averageWidth, averageHeight);
}

- (CGPoint)nextPosition:(AKIPosition)position {
    CGPoint point = CGPointMake(0, 0);
    CGPoint maxPoint = [self viewSize];
    
    switch (position) {
        case AKIPositionTopLeft:
            point.x = maxPoint.x;
            break;
            
        case AKIPositionTopRight:
            point = maxPoint;
            break;
            
        case AKIPositionBottomRight:
            point.y = maxPoint.y;
            break;
            
        default:
            break;
    }
    
    return point;
}

@end
