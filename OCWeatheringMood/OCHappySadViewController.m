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

@property (nonatomic) double temperture;
@property (strong, nonatomic) NSString *city;
@property (nonatomic) int happySad;

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
        self.happySad = 75;
    }
    return self;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
