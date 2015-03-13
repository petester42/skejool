//
//  Schedule.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-13.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Schedule : NSObject {
    
    NSString *semester;
    NSArray *courses;
}

@property (nonatomic,retain) NSString *semester;
@property (nonatomic,retain) NSArray *courses;

-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
