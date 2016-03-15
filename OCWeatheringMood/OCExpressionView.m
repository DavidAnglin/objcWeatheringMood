//
//  OCExpressionView.m
//  OCWeatheringMood
//
//  Created by David Anglin on 3/2/16.
//  Copyright © 2016 David Anglin. All rights reserved.
//

#import "OCExpressionView.h"

IB_DESIGNABLE
@import UIKit;

@interface OCExpressionView ()


@end

@implementation OCExpressionView: UIView

@synthesize lineWidth = _lineWidth;



- (CGPoint)getFaceCenter {
    return [self convertPoint:self.center fromView:self.superview];
}

- (CGFloat)getFaceRadius {
    return MIN(self.bounds.size.width, self.bounds.size.height) / 2 * self.scale;
}

-  (void)setLineWidth:(CGFloat)lineWidth{
    _lineWidth = lineWidth;
    [self setNeedsDisplay];
}

- (void)setColor:(UIColor *)color{
    _color = color;
    [self setNeedsDisplay];
}

- (void)setScale:(CGFloat)scale{
    _scale = scale;
    [self setNeedsDisplay];
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.lineWidth = 3;
        self.color = [UIColor blueColor];
        self.scale = 0.75;
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    UIBezierPath *facePath = [UIBezierPath bezierPathWithArcCenter:self.faceCenter
                                                            radius:self.faceRadius
                                                        startAngle:0
                                                          endAngle:(CGFloat)2*M_PI
                                                         clockwise:TRUE];
    facePath.lineWidth = self.lineWidth;
    [self.color set];
    [facePath stroke];

    

}



@end

