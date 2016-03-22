//
//  OCWeatherViewController.m
//  OCWeatheringMood
//
//  Created by David Anglin on 3/1/16.
//  Copyright © 2016 David Anglin. All rights reserved.
//

#import "OCWeatherViewController.h"
#import "OCWeatherApiCall.h"

@interface OCWeatherViewController() <UITextFieldDelegate>
    
@property (strong, nonatomic) OCWeatherApiCall *weatherData;
@property (strong, nonatomic) NSString *zipCodeText;

@end

@implementation OCWeatherViewController
    
- (void) viewDidLoad
{
    [super viewDidLoad];
    _weatherData.delegate = self;
}


- (void) setWeatherData:(OCWeatherApiCall *)weatherData
{
    _weatherData = weatherData;
}
    
- (IBAction)moodyFace:(UIButton *)sender
{
    self.weatherData.zipCode = self.zipCodeSearch.text;
    [self.weatherData getDegrees];
    [self performSegueWithIdentifier:@"faceDecision" sender:self];

}
    
- (void) updateMood
{
    _cityName = self.weatherData.cityName;
    _temp = self.weatherData.weatherTemp;

}

-(void) setZipCodeText: (NSString *) zipCodeText
{
    self.zipCodeSearch.text = _zipCodeText;
    _zipCodeText = zipCodeText;
}

- (void) setZipCodeSearch:(UITextField *)zipCodeSearch
{
    zipCodeSearch.delegate = self;
    zipCodeSearch.text = self.zipCodeText;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.zipCodeSearch) {
        [textField resignFirstResponder];
        self.zipCodeText = textField.text;
    }
    return true;
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    return (newLength > 5) ? NO : YES;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self view] endEditing:TRUE];
}
    
@end
