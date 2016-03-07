//
//  OCHappySadViewController.h
//  OCWeatheringMood
//
//  Created by David Anglin on 3/2/16.
//  Copyright © 2016 David Anglin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OCExpressionView.h"

@interface OCHappySadViewController : UIViewController <ExpressionViewDataSource>

@property (weak, nonatomic) IBOutlet OCExpressionView *expressionView;

@end
