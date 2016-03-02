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
@property CGFloat *linewidth;
@property UIColor *color;
@property CGFloat *scale;
@property CGPoint *faceCenter;
@property CGFloat *faceRadius;
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
