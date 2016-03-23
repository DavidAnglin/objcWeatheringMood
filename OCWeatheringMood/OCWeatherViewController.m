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
    _weatherData = [[OCWeatherApiCall alloc] init];
    _weatherData.delegate = self;
}

- (IBAction)moodyFace:(UIButton *)sender
{
    self.weatherData.zipCode = self.zipCodeSearch.text;
    [self.weatherData getDegrees];
}

- (void) setTemp:(double)temp
{
    _temp = temp;
}

- (void) setCityName:(NSString *)cityName
{
    _cityName = cityName;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"faceDecision"]) {
        UINavigationController *navController = (UINavigationController*)[segue destinationViewController];
        OCHappySadViewController *hsvc = [navController topViewController];
        if (_temp <= 50) {
            hsvc.happySad = 0;
            hsvc.temperture = _temp;
            hsvc.city = _cityName;
            hsvc.title = @"Cold";
        } else if (_temp >= 50 && _temp <= 75) {
            hsvc.happySad = 70;
            hsvc.temperture = _temp;
            hsvc.city = _cityName;
            hsvc.title = @"Alright";
        } else {
            hsvc.happySad = 100;
            hsvc.temperture = _temp;
            hsvc.city = _cityName;
            hsvc.title = @"Happy";
        }
    }
}


- (void) updateMood
{
    self.cityName = self.weatherData.cityName;
    self.temp = self.weatherData.weatherTemp;
    [self performSegueWithIdentifier:@"faceDecision" sender:self];
}

-(void) setZipCodeText: (NSString *) zipCodeText
{
    _zipCodeText = zipCodeText;
    zipCodeText = self.zipCodeSearch.text;
}

- (void) setZipCodeSearch:(UITextField *)zipCodeSearch
{
    _zipCodeSearch = zipCodeSearch;
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
