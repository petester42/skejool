//
//  Proxy.h
//  Nominator
//
//  Created by Pierre-Marc Airoldi on 11-08-30.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "JSONKit.h"
#import "ProxyRequestHandler.h"


@interface Proxy : NSObject {

    NSRecursiveLock *cancelledLock;
}

+ (id)sharedInstance;

+(void)loginWithUsername:(NSString *)userID andPassword:(NSString *)session;
+(void)getSequenceForUser:(NSString *)userID withSession:(NSString *)session;
+(void)getCoursesForUser:(NSString *)userID withSession:(NSString *)session;
+(void)getSchedulesForUser:(NSString *)userID withSession:(NSString *)session;
+(void)getGeneratedSchedulesForUser:(NSString *)userID withSession:(NSString *)session;
+(void)saveScheduleForUser:(NSString *)userID withSession:(NSString *)session andSchedule:(id)schedule;

@end
