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
@property (nonatomic)  CGFloat *linewidth;
@property (nonatomic) UIColor *color;
@property (nonatomic) CGFloat *scale;
@property (nonatomic) CGPoint *faceCenter;
@property (nonatomic) CGFloat *faceRadius;
typedef struct scaling {
    CGFloat FaceRadiusToEyeRation;
    CGFloat FaceRadiusToEyeOffsetRatio;
    CGFloat FaceRadiusToEyeSeperationRatio;
    CGFloat FaceRadiusToMouthWidthRatio;
    CGFloat FaceRadiusToMouthHeightRatio;
    CGFloat FaceRadiusToMouthOffsetRato;
};
typedef enum eye {
    Left,
    Right
};


@end
