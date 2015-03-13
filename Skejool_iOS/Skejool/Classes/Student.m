//
//  Student.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-10.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Student.h"

@implementation Student 

@synthesize userID,sessionID;

-(id)init{
    
    self = [super init];
    
    if (self) {
        userID = @"";
        sessionID = @"";
    }
    
    return self;
}

-(id)initWithDictionary:(NSDictionary *)student{
    
    self = [super init];
    
    if (self) {
        [self setStudent:student];
    }
    
    return self;
}

-(void)setStudent:(NSDictionary *)student{
    userID = [student objectForKey:@"userID"];
    sessionID = [student objectForKey:@"sessionID"];
}

@end
