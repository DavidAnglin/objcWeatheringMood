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

@property (nonatomic) CGPoint center;

@end

@implementation OCExpressionView: UIView


- (void) setScale1: (CGFloat) scale1
{
    _scale1 = 0.75;
    [self setNeedsDisplay];
}

- (void) setLinewidth: (CGFloat) linewidth
{
    _linewidth = 3;
    _linewidth = linewidth;
    [self setNeedsDisplay];
}


- (void) setColor: (UIColor *) color
{
    _color = UIColor.blueColor;
    [self setNeedsDisplay];
}

- (void) setFaceRadius: (CGFloat) faceRadius
{
    _faceRadius = faceRadius;
//    _faceRadius =  MIN(self.bounds.size.width, self.bounds.size.height) / 2 * _scale1;
    _faceRadius = 10;
}

//struct Scaling {
//    CGFloat FaceRadiusToEyeRation;
//    CGFloat FaceRadiusToEyeOffsetRatio;
//    CGFloat FaceRadiusToEyeSeperationRatio;
//    CGFloat FaceRadiusToMouthWidthRatio;
//    CGFloat FaceRadiusToMouthHeightRatio;
//    CGFloat FaceRadiusToMouthOffsetRato;
//};
//
//enum Eye  {
//    Left,
//    Right
//};

//+ (UIBezierPath) bezierPathForEye:(enum Eye) whichEye
//{
//    
//}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *facePath = [UIBezierPath bezierPath];
                              
    [facePath addArcWithCenter: self.center
                        radius: 100
                    startAngle: 0
                      endAngle: 2*M_PI
                     clockwise:YES];
    
    facePath.lineWidth = 3;
    [_color set];
    [facePath stroke];

    

}



@end

