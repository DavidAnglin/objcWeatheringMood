//
//  OCExpressionView.h
//  OCWeatheringMood
//
//  Created by David Anglin on 3/2/16.
//  Copyright © 2016 David Anglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ExpressionViewDataSource
 - (double)smilinessForExpressionView: ExpressionView;

@end

@interface OCExpressionView : UIView

@property (weak) id <ExpressionViewDataSource> dataSource;
@property (nonatomic, getter=getLineWidth, setter=setLineWidth:)CGFloat lineWidth;
@property (nonatomic, getter=getColor, setter=setColor:)UIColor *color;
@property (nonatomic, getter=getScale, setter=setScale:)CGFloat scale;
@property (readonly, getter=getFaceCenter)CGPoint faceCenter ;
@property (readonly, getter=getFaceRadius)CGFloat faceRadius ;

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
@property struct Scaling scaling;

@end
