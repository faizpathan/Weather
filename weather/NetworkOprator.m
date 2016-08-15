//
//  NetworkOprator.m
//  weather
//
//  Created by faizan on 10/08/16.
//  Copyright © 2016 faizan. All rights reserved.
//

#import "NetworkOprator.h"

@implementation NetworkOprator
    

-(void)downloadData :(NSURL*)URl completion:(void (^)(NSDictionary *))completion
{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URl];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        
        NSError *localError = nil;
        
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&localError];
        
        completion(jsonDict);
        
    }];
    
    [task resume];
    
}


@end
