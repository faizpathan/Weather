//
//  WeatherServices.h
//  weather
//
//  Created by faizan on 10/08/16.
//  Copyright © 2016 faizan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"
#import "NetworkOprator.h"

@interface WeatherServices : NSObject

-(void)getWeatherData:(void (^)(Weather *))completion;

@end
