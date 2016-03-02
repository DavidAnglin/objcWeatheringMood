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

@property (nonatomic) CGRect bounds;
@property (nonatomic) CGPoint center;
@property(nonatomic, readonly) UIView *superview;

@end

@implementation OCExpressionView: UIView

- (CGFloat *) scale
{
    _scale = 2 / 3;
    [self setNeedsDisplay];
    return _scale;
}

- (CGFloat *) linewidth
{
    _linewidth = 3;
    [self setNeedsDisplay];
    return _linewidth;
}

- (UIColor *) color
{
    _color = UIColor.blueColor;
    [self setNeedsDisplay];
    return _color;
}

//- (CGFloat *) faceRadius
//{
//    return  MIN(bounds.size.width, bounds.size.height) / 2 * _scale
//}
//
//+ (CGPoint *) faceCenter
//{
//    return ([UIView convertPoint: center fromView: superview]);
//}
//

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

