//
//  ViewController.m
//  weather
//
//  Created by faizan on 09/08/16.
//  Copyright © 2016 faizan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *tempratureLable;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_indicator startAnimating];
    // Do any additional setup after loading the view, typically from a nib.
    
    WeatherServices *ws = [[WeatherServices alloc] init];
    
    [ws getWeatherData:^(Weather *weather) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSLog(@"%f", weather.temprature);
            
            self.tempratureLable.text = [NSString stringWithFormat:@"%.2f°C" , weather.temprature];
            self.summaryLabel.text = weather.summary;
            
            [_indicator stopAnimating];
            
        });
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
