//
//  Student.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-10.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject {
   
    NSString *userID;
    NSString *sessionID;
}

@property (nonatomic, retain) NSString *userID;
@property (nonatomic, retain) NSString *sessionID;

-(id)initWithDictionary:(NSDictionary *)student;
-(void)setStudent:(NSDictionary *)student;

@end
