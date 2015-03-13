//
//  Time.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Time.h"

@implementation Time 

@synthesize startTime,endTime,weekDay,type,location,section;

-(id)init{
    
    self = [super init];
    
    if (self) {
        startTime = [[NSString alloc] initWithFormat:@"%@",@""];
        endTime =  [[NSString alloc] initWithFormat:@"%@",@""];
        weekDay =  [[NSString alloc] initWithFormat:@"%@",@""];
        type = [[NSString alloc] initWithFormat:@"%@",@""];
        location =  [[NSString alloc] initWithFormat:@"%@",@""];
        section =  [[NSString alloc] initWithFormat:@"%@",@""];
    }
    
    return self;
}
    

-(id)initWithDictionary:(NSDictionary *)dictionary{

    self = [super init];
    
    if (self) {
        startTime = [[NSString alloc] initWithFormat:@"%@",[dictionary objectForKey:@"startTime"]];
        endTime =  [[NSString alloc] initWithFormat:@"%@",[dictionary objectForKey:@"endTime"]];
        weekDay =  [[NSString alloc] initWithFormat:@"%@",[dictionary objectForKey:@"weekDay"]];
        type = [[NSString alloc] initWithFormat:@"%@",[dictionary objectForKey:@"type"]];
        location =  [[NSString alloc] initWithFormat:@"%@",[dictionary objectForKey:@"location"]];
        section =  [[NSString alloc] initWithFormat:@"%@",[dictionary objectForKey:@"section"]]; 
    }
    
    return self;
}

@end
