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

@property struct Scaling scaling;

typedef enum{
    Left, Right
}Eye;

struct Scaling {
    CGFloat FaceRadiusToEyeRadiusRatio;
    CGFloat FaceRadiusToEyeOffsetRatio;
    CGFloat FaceRadiusToEyeSeparationRatio;
    CGFloat FaceRadiusToMouthWidthRatio;
    CGFloat FaceRadiusToMouthHeightRatio;
    CGFloat FaceRadiusToMouthOffsetRatio;
};


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

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.lineWidth = 3;
        self.color = [UIColor blueColor];
        self.scale = 0.75;
        
        _scaling.FaceRadiusToEyeRadiusRatio = 10;
        _scaling.FaceRadiusToEyeOffsetRatio = 3;
        _scaling.FaceRadiusToEyeSeparationRatio = 1.75;
        _scaling.FaceRadiusToMouthWidthRatio = 1;
        _scaling.FaceRadiusToMouthHeightRatio = 3;
        _scaling.FaceRadiusToMouthOffsetRatio = 3;
    }
    return self;
}

- (UIBezierPath *)bezierPathForEye: (Eye) whichEye
{
    CGFloat eyeRadius = self.faceRadius / _scaling.FaceRadiusToEyeRadiusRatio;
    CGFloat eyeVerticalOffset = self.faceRadius / _scaling.FaceRadiusToEyeOffsetRatio;
    CGFloat eyeHorizontalSeperation = self.faceRadius / _scaling.FaceRadiusToEyeSeparationRatio;
    
    CGPoint eyeCenter = self.faceCenter;
    eyeCenter.y -= eyeVerticalOffset;
    
    switch (whichEye) {
        case Left:
            eyeCenter.x -= eyeHorizontalSeperation / 2;
            break;
        case Right:
            eyeCenter.x += eyeHorizontalSeperation / 2;
            break;
        default: break;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter: eyeCenter
                                                        radius: eyeRadius
                                                    startAngle: 0
                                                      endAngle: (CGFloat)2*M_PI
                                                     clockwise: true];
    path.lineWidth = self.lineWidth;
    return path;
    
}

- (UIBezierPath *) bezierPathForSmile: (double) fractionOfMaxSmile
{
    CGFloat mouthWidth = self.faceRadius / _scaling.FaceRadiusToMouthWidthRatio;
    CGFloat mouthHeight = self.faceRadius / _scaling.FaceRadiusToMouthHeightRatio;
    CGFloat mouthVerticalOffset = self.faceRadius / _scaling.FaceRadiusToMouthOffsetRatio;
    
    CGFloat smileHeight = (MAX(MIN(fractionOfMaxSmile, 1), -1)) * mouthHeight;
    
    CGPoint start = CGPointMake(self.faceCenter.x - mouthWidth / 2, self.faceCenter.y + mouthVerticalOffset);
    CGPoint end = CGPointMake(start.x + mouthWidth, start.y);
    CGPoint cp1 = CGPointMake(start.x + mouthWidth/ 3, start.y + smileHeight);
    CGPoint cp2 = CGPointMake(end.x - mouthWidth / 3, cp1.y);
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:start];
    [path addCurveToPoint:end controlPoint1:cp1 controlPoint2:cp2];
    path.lineWidth = self.lineWidth;
    return path;
}


- (void)drawRect:(CGRect)rect
{
    UIBezierPath *facePath = [UIBezierPath bezierPathWithArcCenter: self.faceCenter
                                                            radius: self.faceRadius
                                                        startAngle: 0
                                                          endAngle: (CGFloat)2*M_PI
                                                         clockwise: TRUE];
    facePath.lineWidth = self.lineWidth;
    [self.color set];
    [facePath stroke];
    
    [[self bezierPathForEye:Left] stroke];
    [[self bezierPathForEye:Right] stroke];
    
    double smiliness = self.dataSource ? [self.dataSource smilinessForExpressionView:self] : 0;
    UIBezierPath *smilePath = [self bezierPathForSmile:smiliness];
    [smilePath stroke];
    
    
}





@end

