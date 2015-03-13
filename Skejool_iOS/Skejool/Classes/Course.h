//
//  Course.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Time.h"

@interface Course : NSObject {
  
    NSString *courseID;
    NSString *courseName;
    NSString *credits;
    NSMutableArray *time;
    BOOL completed;
    UIColor *color;
}

@property (nonatomic, retain) NSString *courseID;
@property (nonatomic, retain) NSString *courseName;
@property (nonatomic, retain) NSString *credits;
@property (nonatomic, retain) NSMutableArray *time;
@property (nonatomic) BOOL completed;
@property (nonatomic,retain) UIColor *color;

-(id)initWithDictionary:(NSDictionary *)course;
//-(id)initWithCourse:(Course *)course;
-(void)setCourse:(NSDictionary *)course;
//-(NSString *)description;

@end
