//
//  OCWeatherApiCall.m
//  OCWeatheringMood
//
//  Created by David Anglin on 3/22/16.
//  Copyright © 2016 David Anglin. All rights reserved.
//

#import "OCWeatherApiCall.h"
#import "AFNetworking.h"

@implementation OCWeatherApiCall
    
- (void) getDegrees
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *url = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?zip=%@,us&units=imperial&appid=625e9e3bac6a3dde3d015dee3e1b54e1", self.zipCode];
     [manager GET: url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *jsonDict = (NSDictionary *) responseObject;
        NSLog(@"%@", [jsonDict description]);
        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@", string);
        dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate updateMood];
        });
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}


     
@end


//"http://api.openweathermap.org/data/2.5/weather?zip=%i,us&units=imperial&appid=625e9e3bac6a3dde3d015dee3e1b54e1"