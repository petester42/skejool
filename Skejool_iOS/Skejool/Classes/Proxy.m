//
//  Proxy.m
//  Nominator
//
//  Created by Pierre-Marc Airoldi on 11-08-30.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Proxy.h"

@implementation Proxy

static Proxy *sharedInstance = nil;

// Get the shared instance and create it if necessary.
+ (Proxy *)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    
    return sharedInstance;
}

// We can still have a regular init method, that will get called the first time the Singleton is used.
- (id)init
{
    self = [super init];
    
    if (self) {
       
    }
    
    return self;
}

#pragma data methods

+(void)loginWithUsername:(NSString *)userID andPassword:(NSString *)password{

    NSDictionary *arguments = [NSDictionary dictionaryWithObjectsAndKeys:userID, @"userID", password, @"password", nil];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/getStudent",API_LINK]];
    
    ASIFormDataRequest *request  = [ASIFormDataRequest requestWithURL:url];
    [request addRequestHeader:@"Content-Type" value:@"application/json; charset=utf-8"];
    [request appendPostData:[[arguments JSONString] dataUsingEncoding:NSUTF8StringEncoding]];
    [request  setRequestMethod:@"POST"]; 
    request.tag = 0;
    
    ProxyRequestHandler *handler = [[ProxyRequestHandler alloc] init];
    [handler sendRequest:request withDelegate:[Data sharedInstance]];

}

+(void)getSequenceForUser:(NSString *)userID withSession:(NSString *)session{
    
    NSDictionary *arguments = [NSDictionary dictionaryWithObjectsAndKeys:userID, @"userID", session, @"session", nil];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/getStudent",API_LINK]];
    
    ASIFormDataRequest *request  = [ASIFormDataRequest requestWithURL:url];
    [request addRequestHeader:@"Content-Type" value:@"application/json; charset=utf-8"];
    [request appendPostData:[[arguments JSONString] dataUsingEncoding:NSUTF8StringEncoding]];
    [request  setRequestMethod:@"POST"]; 
    request.tag = 1;
    
    ProxyRequestHandler *handler = [[ProxyRequestHandler alloc] init];
    [handler sendRequest:request withDelegate:[Data sharedInstance]];
}

+(void)getCoursesForUser:(NSString *)userID withSession:(NSString *)session{
   
    NSDictionary *arguments = [NSDictionary dictionaryWithObjectsAndKeys:userID, @"userID", session, @"session", nil];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/getStudent",API_LINK]];
    
    ASIFormDataRequest *request  = [ASIFormDataRequest requestWithURL:url];
    [request addRequestHeader:@"Content-Type" value:@"application/json; charset=utf-8"];
    [request appendPostData:[[arguments JSONString] dataUsingEncoding:NSUTF8StringEncoding]];
    [request  setRequestMethod:@"POST"]; 
    request.tag = 2;
    
    ProxyRequestHandler *handler = [[ProxyRequestHandler alloc] init];
    [handler sendRequest:request withDelegate:[Data sharedInstance]];
}

+(void)getSchedulesForUser:(NSString *)userID withSession:(NSString *)session{
    
    NSDictionary *arguments = [NSDictionary dictionaryWithObjectsAndKeys:userID, @"userID", session, @"session", nil];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/getStudent",API_LINK]];
    
    ASIFormDataRequest *request  = [ASIFormDataRequest requestWithURL:url];
    [request addRequestHeader:@"Content-Type" value:@"application/json; charset=utf-8"];
    [request appendPostData:[[arguments JSONString] dataUsingEncoding:NSUTF8StringEncoding]];
    [request  setRequestMethod:@"POST"]; 
    request.tag = 3;
    
    ProxyRequestHandler *handler = [[ProxyRequestHandler alloc] init];
    [handler sendRequest:request withDelegate:[Data sharedInstance]];

}

+(void)getGeneratedSchedulesForUser:(NSString *)userID withSession:(NSString *)session{
 
    NSDictionary *arguments = [NSDictionary dictionaryWithObjectsAndKeys:userID, @"userID", session, @"session", nil];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/getStudent",API_LINK]];
    
    ASIFormDataRequest *request  = [ASIFormDataRequest requestWithURL:url];
    [request addRequestHeader:@"Content-Type" value:@"application/json; charset=utf-8"];
    [request appendPostData:[[arguments JSONString] dataUsingEncoding:NSUTF8StringEncoding]];
    [request  setRequestMethod:@"POST"]; 
    request.tag = 4;
    
    ProxyRequestHandler *handler = [[ProxyRequestHandler alloc] init];
    [handler sendRequest:request withDelegate:[Data sharedInstance]];

}

+(void)saveScheduleForUser:(NSString *)userID withSession:(NSString *)session andSchedule:(id)schedule{
 
    NSDictionary *arguments = [NSDictionary dictionaryWithObjectsAndKeys:userID, @"userID", session, @"session", nil];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/getStudent",API_LINK]];
    
    ASIFormDataRequest *request  = [ASIFormDataRequest requestWithURL:url];
    [request addRequestHeader:@"Content-Type" value:@"application/json; charset=utf-8"];
    [request appendPostData:[[arguments JSONString] dataUsingEncoding:NSUTF8StringEncoding]];
    [request  setRequestMethod:@"POST"]; 
    request.tag = 5;
    
    ProxyRequestHandler *handler = [[ProxyRequestHandler alloc] init];
    [handler sendRequest:request withDelegate:[Data sharedInstance]];
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
