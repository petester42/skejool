//
//  Course.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Course.h"

@implementation Course

@synthesize courseID,courseName,credits,completed,time,color;

-(id)init{
    
    self = [super init];
    
    if (self) {
        courseID = [[NSString alloc] initWithString:@""];
        courseName = [[NSString alloc] initWithString:@""];
        credits = [[NSString alloc] initWithString:@""];
        completed = 0;
        time = [[NSMutableArray alloc] init];
        color = [UIColor clearColor];
    }
    
    return self;
}

-(id)initWithDictionary:(NSDictionary *)course{
    
    self = [super init];
    
    if (self) {
        courseID = [[NSString alloc] initWithFormat:@"%@",[course objectForKey:@"CourseID"]];
        courseName =  [[NSString alloc] initWithFormat:@"%@",[course objectForKey:@"CourseName"]];
        credits =  [[NSString alloc] initWithFormat:@"%@",[course objectForKey:@"numberOfCredits"]];
        completed = [[course objectForKey:@"completed"] boolValue];
        time = [[NSMutableArray alloc] init];
        color = [UIColor clearColor];

        NSMutableArray *tempTime = [[NSMutableArray alloc] init];
        
        for (NSDictionary *timeData in [course objectForKey:@"time"]) {
            
            Time *courseTime = [[Time alloc] initWithDictionary:timeData];
            [tempTime addObject:courseTime];
            [courseTime release];
        }
        
        [time setArray:tempTime];
        [tempTime release];
        
    }
    
    return self;
}

-(void)setCourse:(NSDictionary *)course{
    
    courseID = [NSString stringWithFormat:@"%@",[course objectForKey:@"CourseID"]];
    courseName =  [NSString stringWithFormat:@"%@",[course objectForKey:@"CourseName"]];
    credits =  [NSString stringWithFormat:@"%@",[course objectForKey:@"numberOfCredits"]];
    completed = [[course objectForKey:@"completed"] boolValue];
    color = [UIColor clearColor];
    
    NSMutableArray *tempTime = [[NSMutableArray alloc] init];
    
    for (NSDictionary *timeData in [course objectForKey:@"time"]) {
        
        Time *courseTime = [[Time alloc] initWithDictionary:timeData];
        [tempTime addObject:courseTime];
        [courseTime release];
    }
    
    [time setArray:tempTime];
    [tempTime release];
}

//-(NSString *)description{
//    return @"";
//}

//-(id)initWithCourse:(Course *)course{
//       
//    self = [super init];
//    
//    if (self) {
//        courseID = @"";
//        courseName = @"";
//        credits = @"";
//        completed = 0;
//        /*courseID = course.courseID;
//        courseName = course.courseName;
//        credits = course.credits;
//        completed = course.completed;*/
//    }
//    
//    return self;
//}

@end
