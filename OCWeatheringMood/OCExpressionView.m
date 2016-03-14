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


- (CGFloat) scale1
{
    _scale = 0.75;
    [self setNeedsDisplay];
    return _scale;
}

- (CGFloat) linewidth
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

- (CGFloat) faceRadius
{
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    return  MIN(width, height) / 2 * _scale;
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





- (CGPoint) faceCenter
{
  
}

- (void)drawRect:(CGRect)rect {
    
UIBezierPath *facePath = [UIBezierPath bezierPathWithArcCenter: _faceCenter
                                                        radius:_faceRadius
                                                    startAngle:0
                                                      endAngle: 2*M_PI
                                                     clockwise:YES];
    
    facePath.lineWidth = _linewidth;
    [_color set];
    [facePath stroke];
    
    
    
    
    
    

    
    

}

@end

