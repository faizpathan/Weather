//
//  WeatherServices.m
//  weather
//
//  Created by faizan on 10/08/16.
//  Copyright © 2016 faizan. All rights reserved.
//

#import "WeatherServices.h"

@implementation WeatherServices

id baseURL = @"http://api.openweathermap.org/data/2.5/weather";
id cityId = @"1277333";
id APIKey = @"c2723d669392f533d11bae3b985740a9";
id units = @"metric";

-(NSURL*)constructURL{
    
    NSURLComponents *urlComponent = [NSURLComponents componentsWithString:baseURL];
    NSURLQueryItem *param1 = [NSURLQueryItem queryItemWithName:@"id" value:cityId];
    NSURLQueryItem *param2 = [NSURLQueryItem queryItemWithName:@"appid" value:APIKey];
    NSURLQueryItem *param3 = [NSURLQueryItem queryItemWithName:@"units" value:units];
    urlComponent.queryItems = @[ param1, param2, param3 ];
    return urlComponent.URL;
    
}

-(void)getWeatherData:(void (^)(Weather *))completion
{
    //NSURL *urlc = self.constructURL;
    
    NetworkOprator  *nw = [[NetworkOprator alloc] init];
    
    [nw downloadData:self.constructURL completion:^(NSDictionary *jsonDict) {
        
        Weather *weather = [self parseJSON:jsonDict];
        completion(weather);
        NSLog(@"%f", weather.temprature);
        NSLog(@"%@", weather.summary);
        
    }];
  
}

-(Weather *) parseJSON:(NSDictionary*)json{
    
    Weather *weather = [[Weather alloc] init];
    NSDictionary *dictFromJSON;
    NSArray *dict = [json valueForKey:@"weather"];

        if ((dictFromJSON = json[@"main"])){
        
            weather.temprature   = [[dictFromJSON valueForKey:@"temp"] doubleValue];
        
        }
    
        for (NSDictionary *item in dict) {
        
            weather.summary = [item valueForKey:@"description"];
        
        }
    return weather;
}


@end
