//
//  Time.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Time : NSObject {
    
    NSString *startTime;
    NSString *endTime;
    NSString *weekDay;
    NSString *type;
    NSString *location;
    NSString *section;
}

@property (nonatomic, retain) NSString *startTime;
@property (nonatomic, retain) NSString *endTime;
@property (nonatomic, retain) NSString *weekDay;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *location;
@property (nonatomic, retain) NSString *section;

-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
