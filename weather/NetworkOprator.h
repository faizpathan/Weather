//
//  NetworkOprator.h
//  weather
//
//  Created by faizan on 10/08/16.
//  Copyright © 2016 faizan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NetworkOprator : NSObject

-(void)downloadData :(NSURL*)URl completion:(void (^)(NSDictionary *))completion;


@end
