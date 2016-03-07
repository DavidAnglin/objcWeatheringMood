//
//  OCExpressionView.m
//  OCWeatheringMood
//
//  Created by David Anglin on 3/2/16.
//  Copyright © 2016 David Anglin. All rights reserved.
//

#import "OCExpressionView.h"
@import UIKit;

@interface OCExpressionView ()


@end
@implementation OCExpressionView: UIView


- (CGFloat) scale1
{
    _scale1 = 2 / 3;
    [self setNeedsDisplay];
    return ((_scale1));
}

- (CGFloat) linewidth
{
    _linewidth = 3;
    [self setNeedsDisplay];
    return (_linewidth);
}

- (UIColor *) color
{
    _color = UIColor.blueColor;
    [self setNeedsDisplay];
    return _color;
}

- (CGFloat) faceRadius
{
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    return  MIN(width, height) / 2 * _scale1;
}

//+ (CGPoint) faceCenter
//{
//    
//    
//    self.ExpressionView.center = CGPointMake(CGRectGetMidX(superview.bounds), CGRectGetMidY(superview.bounds));
//}


//
//UIBezierPath *facePath = [UIBezierPath bezierPathWithArcCenter: faceCenter
//                                                        radius: faceRadius
//                                                    startAngle: 0
//                                                      endAngle: (2*M_PI)
//                                                     clockwise: YES];
//
//    
//


- (void)drawRect:(CGRect)rect {


}

@end

