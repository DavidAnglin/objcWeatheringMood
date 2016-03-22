//
//  OCWeatherApiCall.h
//  OCWeatheringMood
//
//  Created by David Anglin on 3/22/16.
//  Copyright © 2016 David Anglin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@protocol OpenWeatherMapDelegate 
    - (void) updateMood;
@end

@interface OCWeatherApiCall : NSObject

@property (weak) id <OpenWeatherMapDelegate> delegate;
@property (nonatomic, strong) NSString *zipCode;
@property (nonatomic, strong) NSString *cityName;
@property (nonatomic) double weatherTemp;
    
- (void) getDegrees;
    
@end
