//
//  OCExpressionView.m
//  OCWeatheringMood
//
//  Created by David Anglin on 3/2/16.
//  Copyright © 2016 David Anglin. All rights reserved.
//

#import "OCExpressionView.h"
@import UIKit;

@implementation OCExpressionView

@synthesize faceCenter, faceRadius, scale, color, linewidth;

- (UIBezierPath *)createArcPath
{
    UIBezierPath *facePath = [UIBezierPath bezierPathWithArcCenter: _faceCenter
                                                            radius: _faceRadius
                                                        startAngle: 0
                                                          endAngle: (2*M_PI)
                                                         clockwise: YES];
    return facePath;
    
}


- (void)drawRect:(CGRect)rect {


}

@end

