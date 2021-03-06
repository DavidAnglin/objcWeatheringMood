//
//  OCWeatherViewController.h
//  OCWeatheringMood
//
//  Created by David Anglin on 3/1/16.
//  Copyright © 2016 David Anglin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OCExpressionView.h"
#import "OCHappySadViewController.h"
#import "OCWeatherApiCall.h"

@interface OCWeatherViewController : OCHappySadViewController <OpenWeatherMapDelegate>

@property (weak, nonatomic) IBOutlet UITextField *zipCodeSearch;
@property (nonatomic) double temp;
@property (strong,nonatomic) NSString *cityName;



@end

