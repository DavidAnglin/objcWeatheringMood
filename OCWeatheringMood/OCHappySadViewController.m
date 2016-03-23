//
//  OCHappySadViewController.m
//  OCWeatheringMood
//
//  Created by David Anglin on 3/2/16.
//  Copyright © 2016 David Anglin. All rights reserved.
//

#import "OCHappySadViewController.h"
#import "OCExpressionView.h"

@interface OCHappySadViewController()

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end


@implementation OCHappySadViewController

- (void) setExpressionView: (OCExpressionView *) expressionView
{
    expressionView.dataSource = self;
    [self updateUI];
}

- (void) setHappySad:(int)happySad
{
    _happySad = happySad;
    happySad = MIN(MAX(_happySad, 0), 100);
    [self updateUI];
}

- (void) setInfoLabel:(UILabel *)infoLabel
{
    _infoLabel = infoLabel;
    self.infoLabel.text = [NSString stringWithFormat: @"In the City of %@ the Temperture is %g°", self.city, self.temperture];
}

- (void) updateUI
{
    [self.expressionView setNeedsDisplay];
}

- (double) smilinessForExpressionView:(id) expressionView
{
    return (double) (self.happySad - 50) / 50;
}

-(instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.happySad = 50;
    }
    return self;
}

@end
