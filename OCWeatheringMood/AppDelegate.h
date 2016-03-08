//
//  AppDelegate.h
//  OCWeatheringMood
//
//  Created by David Anglin on 3/1/16.
//  Copyright © 2016 David Anglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OCWeatherViewController;
@class OCHappySadViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) OCWeatherViewController *weatherViewController;
@property (strong, nonatomic) OCHappySadViewController *happySadViewController;
@end

