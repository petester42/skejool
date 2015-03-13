//
//  Data.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-10.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Data.h"

@implementation Data

@synthesize images,mainMenu,generateScheduleMenu,loginData,Courses,Sequence,Schedules,time, colors, TimeConstraints, ClassConstraints, CreditConstraints,GeneratedSchedules;

static Data *sharedInstance = nil;

// Get the shared instance and create it if necessary.
+ (Data *)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    
    return sharedInstance;
}

/*-(void)createTime {
    
    NSString *time1 = @"";
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    int hour = 0;
    int minutes = 0;
    
    while (![time1 isEqualToString:@"23:45"]) {
        
        NSString *minute = @"";
        NSString *fullSTR = @"";
        
        if (minutes == 0) {
            minute = @"00";
        }
        
        else {
            minute = [NSString stringWithFormat:@"%i",minutes];
        }
        
        fullSTR = [NSString stringWithFormat:@"%i:%@", hour,minute];
        
        [array addObject:fullSTR];
        
        if (minutes == 45) {
            minutes = 0;
            hour++;
        }
        
        else {
            minutes +=15;
        }
        
        time1 = fullSTR;
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Time.plist"];
    
    [array writeToFile:path atomically:YES];
    [array release];
}*/

// We can still have a regular init method, that will get called the first time the Singleton is used.
- (id)init
{
    self = [super init];
    
    if (self) {
//     [self createTime];
                
        images = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Images" ofType:@"plist"]];

        mainMenu = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MainMenu" ofType:@"plist"]];
        generateScheduleMenu = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"GenerateSchedule" ofType:@"plist"]];
        time = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Time" ofType:@"plist"]];
        colors = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Colors" ofType:@"plist"]];
    
        loginData = [[Student alloc] init];
        Courses = [[NSMutableArray alloc] init];
        Sequence = [[NSMutableArray alloc] init];
        Schedules = [[NSMutableArray alloc] init];
        GeneratedSchedules = [[NSMutableArray alloc] init];
        
        TimeConstraints = [[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TimeConstraints" ofType:@"plist"]];
        ClassConstraints = [[NSMutableArray alloc] init];
        CreditConstraints = [[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CreditConstraints" ofType:@"plist"]];
    }
    
    return self;
}

-(void)clearData{
    [loginData release];
    [Sequence release];
    [Courses release];
    [Schedules release];
    [GeneratedSchedules release];
    [TimeConstraints release];
    [ClassConstraints release];
    [CreditConstraints release];
    
    loginData = [[Student alloc] init];
    Sequence = [[NSMutableArray alloc] init];
    Courses = [[NSMutableArray alloc] init];
    Schedules = [[NSMutableArray alloc] init];
    GeneratedSchedules = [[NSMutableArray alloc] init];
    TimeConstraints = [[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TimeConstraints" ofType:@"plist"]];
    ClassConstraints = [[NSMutableArray alloc] init];
    CreditConstraints = [[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CreditConstraints" ofType:@"plist"]];
}

-(void)clearConstraints{
   
    [TimeConstraints release];
    [ClassConstraints release];
    [CreditConstraints release];
    
    TimeConstraints = [[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TimeConstraints" ofType:@"plist"]];
    ClassConstraints = [[NSMutableArray alloc] init];
    CreditConstraints = [[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CreditConstraints" ofType:@"plist"]];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"clearConstraints" object:nil];
}

-(void)returnData:(NSDictionary *)dictionary{
    
    if ([[dictionary objectForKey:@"type"] isEqualToString:@"login"]) {
        
        [loginData setStudent:[dictionary objectForKey:@"data"]];
       
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loginRequestDone" object:nil];
    }
    
    else if ([[dictionary objectForKey:@"type"] isEqualToString:@"viewSequence"]){
        
        [Sequence setArray:[Helper setSequence:[dictionary objectForKey:@"data"]]];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getSequenceRequestDone" object:nil];
    }
    
    else if ([[dictionary objectForKey:@"type"] isEqualToString:@"viewCourses"]){
        
        [Courses setArray:[Helper setCourses:[dictionary objectForKey:@"data"]]];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getCoursesRequestDone" object:nil];
    }
    
    else if ([[dictionary objectForKey:@"type"] isEqualToString:@"viewSchedules"]){
        
        [Schedules setArray:[Helper setSchedules:[dictionary objectForKey:@"data"]]];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getSchedulesRequestDone" object:nil];
    }
    
    else if ([[dictionary objectForKey:@"type"] isEqualToString:@"generateSchedules"]){
        [GeneratedSchedules setArray:[Helper setSchedules:[dictionary objectForKey:@"data"]]];
            
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getGenerateSchedulesRequestDone" object:nil];
    }
    
    else if ([[dictionary objectForKey:@"type"] isEqualToString:@"savedSchedule"]){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[[dictionary objectForKey:@"data"] objectForKey:@"title"] message:[[dictionary objectForKey:@"data"] objectForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alert show];
        [alert release];
    }
    
    else if ([[dictionary objectForKey:@"type"] isEqualToString:@"error"]){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:[[dictionary objectForKey:@"data"] objectForKey:@"error"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alert show];
        [alert release];
    }
    
    else {
        NSLog(@"Something has gone terribly wrong!");
    }
}

#pragma singleton methods
// Your dealloc method will never be called, as the singleton survives for the duration of your app.
// However, I like to include it so I know what memory I'm using (and incase, one day, I convert away from Singleton).
-(void)dealloc
{
    // I'm never called!
    [super dealloc];
}

// We don't want to allocate a new instance, so return the current one.
+ (id)allocWithZone:(NSZone*)zone {
    return [[self sharedInstance] retain];
}

// Equally, we don't want to generate multiple copies of the singleton.
- (id)copyWithZone:(NSZone *)zone {
    return self;
}

// Once again - do nothing, as we don't have a retain counter for this object.
- (id)retain {
    return self;
}

// Replace the retain counter so we can never release this object.
- (NSUInteger)retainCount {
    return NSUIntegerMax;
}

// This function is empty, as we don't want to let the user release this object.
- (oneway void)release {
    
}

//Do nothing, other than return the shared instance - as this is expected from autorelease.
- (id)autorelease {
    return self;
}

@end
