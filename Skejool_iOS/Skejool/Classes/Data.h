//
//  Data.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-10.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface Data : NSObject <ProxyDelegate> {
    
    NSDictionary *images;
    NSArray *mainMenu;
    NSArray *generateScheduleMenu;
    NSArray *time;
    NSArray *colors;
    
    Student *loginData;
    NSMutableArray *Courses;
    NSMutableArray *Sequence;
    NSMutableArray *Schedules;
    NSMutableArray *GeneratedSchedules;
    NSMutableDictionary *TimeConstraints;
    NSMutableArray *ClassConstraints;
    NSMutableDictionary *CreditConstraints;
}

@property (nonatomic, retain) NSArray *time;
@property (nonatomic, retain) NSDictionary *images;
@property (nonatomic, retain) NSArray *mainMenu;
@property (nonatomic, retain) NSArray *generateScheduleMenu;
@property (nonatomic, retain) Student *loginData;
@property (nonatomic, retain) NSMutableArray *Courses;
@property (nonatomic, retain) NSMutableArray *Sequence;
@property (nonatomic, retain) NSMutableArray *Schedules;
@property (nonatomic, retain) NSMutableArray *GeneratedSchedules;
@property (nonatomic, retain) NSArray *colors;
@property (nonatomic, retain) NSMutableDictionary *TimeConstraints;
@property (nonatomic, retain) NSMutableArray *ClassConstraints;
@property (nonatomic, retain) NSMutableDictionary *CreditConstraints;

+ (id)sharedInstance;
-(void)clearData;
-(void)clearConstraints;

@end
