//
//  Schedule.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-13.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Schedule.h"

@implementation Schedule

@synthesize semester,courses;

-(id)init{
    
    self = [super init];
    
    if (self) {
        semester = [[NSString alloc] initWithFormat:@"%@",@""];
        courses = [[NSArray alloc] init];

    }
    
    return self;
}


-(id)initWithDictionary:(NSDictionary *)dictionary{
    
    self = [super init];
    
    if (self) {
        
        semester = [[NSString alloc] initWithFormat:@"%@",[dictionary objectForKey:@"semester"]];
        courses = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"courses"]];
    }
        
    return self;
}

@end
