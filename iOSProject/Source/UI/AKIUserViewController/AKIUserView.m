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
@property (nonatomic, readwrite) BOOL    run;

- (CGRect)coordinates;
- (CGPoint)nextPosition;

@end

@implementation AKIUserView

#pragma mark -
#pragma mark Public

- (void)startAnimation {
    [self setSquarePosition];
}

- (void)stopAnimation {
    self.run = NO;
}

- (void)moveRouteLabel {
    [self setSquarePosition];
    [self stopAnimation];
}

- (BOOL)isRunning {
    return _run;
}

#pragma mark -
#pragma mark Change square position

- (void)setSquarePosition {
    self.run = YES;
    [self setSquarePosition:self.squarePosition animated:YES];
}

#pragma mark -
#pragma mark Private

- (CGRect)coordinates {
    return CGRectMake(self.bounds.origin.x, self.bounds.origin.y, [[UIScreen mainScreen] bounds].size.width - self.label.bounds.size.width, [[UIScreen mainScreen] bounds].size.height - self.label.bounds.size.height);
}

- (CGPoint)nextPosition:(AKIPosition)position {
    CGRect rect = [self coordinates];
    CGPoint point = CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGPoint maxPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect));
    
    switch (position) {
        case AKIPositionFirst:
            point.x = maxPoint.x;
            break;
            
        case AKIPositionSecond:
            point = maxPoint;
            break;
            
        case AKIPositionThird:
            point.y = maxPoint.y;
            break;
            
        default:
            point = CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect));
            break;
    }
    
    return point;
}

- (void)setSquarePosition:(AKIPosition)squarePosition
                 animated:(BOOL)animated
{
    if (self.run) {
        [self setSquarePosition:squarePosition animated:animated withCompletionHandler:^{
            self.squarePosition == AKIPositionFourth ? self.squarePosition = AKIPositionFirst : self.squarePosition++;
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
