//
//  AKIUserView.m
//  iOSProject
//
//  Created by Alexey Khomych on 28.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIUserView.h"

#import <math.h>

@interface AKIUserView()
@property (nonatomic, assign)   CGFloat x;
@property (nonatomic, assign)   CGFloat y;

@property (nonatomic, retain)   NSTimer *timer;

@end

@implementation AKIUserView

#pragma mark -
#pragma mark Public

- (void)moveRouteLabel {
    [self setSquarePosition];
}

- (SEL)nextPosition {
    switch (self.squarePosition) {
        case AKIPositionFirst:
            return @selector(AKIPositionSecond); break;
        case AKIPositionSecond:
            return @selector(AKIPositionThird); break;
        case AKIPositionThird:
            return @selector(AKIPositionFourth); break;
        case AKIPositionFourth:
            return @selector(AKIPositionFirst); break;
            
        default: return 0;
    }
}

- (void)startAnimation {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:5.0
                                     target:self
                                   selector:@selector(setSquarePosition)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)stopAnimation {
    [self.timer invalidate];
}

#pragma mark -
#pragma mark Change square position

- (void)setSquarePosition {
    [self setSquarePosition:self.squarePosition withAnimated:YES];
}
- (void)setSquarePosition:(AKIPosition)squarePosition withAnimated:(BOOL)animated {
    if (animated) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:5.0];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    }
    
    [self performSelector:[self nextPosition]];
    
    NSUInteger width = self.label.frame.size.width;
    NSUInteger height = self.label.frame.size.height;
    
    self.label.transform = CGAffineTransformMakeTranslation(self.x - width, self.y - height);
    
    if (animated) {
        [UIView commitAnimations];
    }
}
- (void)setSquarePosition:(AKIPosition)squarePosition withAnimated:(BOOL)animated withCompletionHandler:(AKICompletionHandler)completionHandler {
    [self setSquarePosition:squarePosition withAnimated:animated];
    
    completionHandler();
}

#pragma mark -
#pragma mark Selector

-(void)AKIPositionFirst {
    self.x = self.label.frame.size.width;
    self.y = self.label.frame.size.height;
    self.squarePosition = AKIPositionFirst;
}

-(void)AKIPositionSecond {
    self.x = [[UIScreen mainScreen] bounds].size.width;
    self.y = self.label.frame.size.height;
    self.squarePosition = AKIPositionSecond;
}

-(void)AKIPositionThird {
    self.x = [[UIScreen mainScreen] bounds].size.width;;
    self.y = [[UIScreen mainScreen] bounds].size.height;;
    self.squarePosition = AKIPositionThird;
}

-(void)AKIPositionFourth {
    self.x = self.label.frame.size.width;
    self.y = [[UIScreen mainScreen] bounds].size.height;
    self.squarePosition = AKIPositionFourth;
}

@end
