//
//  ProxyRequestHandler.m
//  Nominator
//
//  Created by Pierre-Marc Airoldi on 11-09-06.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ProxyRequestHandler.h"

@implementation ProxyRequestHandler

@synthesize proxyDelegate;

- (id)init
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

-(void)sendRequest:(ASIFormDataRequest *)request withDelegate:(id)delegate{
    
    proxyDelegate = delegate;
    
    [request setDelegate:self];
//    [request startAsynchronous];
    
    [self showHUDWithText:@"Downloading" withSelector:@selector(startAsynchronous) onTarget:request withObject:nil];
}

#pragma ASIHTTP methods

- (void)requestFinished:(ASIHTTPRequest *)request{
    //NSLog([request description]);
    
    if (request.tag == 0) {
        
        if([proxyDelegate respondsToSelector:@selector(returnData:)]){        
                        
            NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys:@"9601643",@"userID",@"password",@"sessionID", nil];
            
            NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"login",@"type",data,@"data", nil];
        
            [proxyDelegate returnData:dict];
        
            [data release];
            [dict release];
        }
    }
    
    else if (request.tag == 1) {
        
        if([proxyDelegate respondsToSelector:@selector(returnData:)]){        
            
            NSArray *data = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"testSequenceViewData" ofType:@"plist"]];
            
            NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"viewSequence",@"type",data,@"data", nil];
            
            [proxyDelegate returnData:dict];
            
            [data release];
            [dict release];
        }
    }

    else if (request.tag == 2) {
        
        if([proxyDelegate respondsToSelector:@selector(returnData:)]){        
            
            NSArray *data = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"testCourseViewData" ofType:@"plist"]];
            
            NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"viewCourses",@"type",data,@"data", nil];
            
            [proxyDelegate returnData:dict];
            
            [data release];
            [dict release];
        }
    }
    
    else if (request.tag == 3) {
        
        if([proxyDelegate respondsToSelector:@selector(returnData:)]){        
            
            NSArray *data = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"testScheduleViewData" ofType:@"plist"]];
            
            NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"viewSchedule",@"type",data,@"data", nil];
            
            [proxyDelegate returnData:dict];
            
            [data release];
            [dict release];
            
        }
    }
    
    else if (request.tag == 4) {
        
        if([proxyDelegate respondsToSelector:@selector(returnData:)]){        
            
            NSArray *data = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"testGeneratedScheduleViewData" ofType:@"plist"]];
            
            NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"generateSchedules",@"type",data,@"data", nil];
            
            [proxyDelegate returnData:dict];
            
            [data release];
            [dict release];
            
        }
    }
    
    else if (request.tag == 5) {
        
        if([proxyDelegate respondsToSelector:@selector(returnData:)]){        
            
            NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys:SAVED_TITLE,@"title",SAVED_MESSAGE,@"message", nil];
            
            NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"savedSchedule",@"type",data,@"data", nil];
            
            [proxyDelegate returnData:dict];
            
            [data release];
            [dict release];
        }
    }
    
    else {
        
        NSLog(@"Something has gone terribly wrong!");        
        
    }
    
}

- (void)requestFailed:(ASIHTTPRequest *)request{

    NSLog(@"error");
#warning for test only comment out comments to enable errors

    if (request.tag == 0) {
        
        if([proxyDelegate respondsToSelector:@selector(returnData:)]){        
            
            NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys:@"9601643",@"userID",@"password",@"sessionID", nil];
            
            NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"login",@"type",data,@"data", nil];
            
            [proxyDelegate returnData:dict];
            
            [data release];
            [dict release];
            
            /*NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys:LOGIN_REQUEST_FAILED,@"error", nil];
            NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"error",@"type",data,@"data", nil];
            
            [proxyDelegate returnData:dict];
            
            [data release];
            [dict release];*/
        }
    }
    
    else if (request.tag == 1) {
        
        if([proxyDelegate respondsToSelector:@selector(returnData:)]){        
            
            NSArray *data = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"testSequenceViewData" ofType:@"plist"]];
            
            NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"viewSequence",@"type",data,@"data", nil];
            
            [proxyDelegate returnData:dict];
            
            [data release];
            [dict release];
            
            /*NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys:LOGIN_REQUEST_FAILED,@"error", nil];
             NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"error",@"type",data,@"data", nil];
             
             [proxyDelegate returnData:dict];
             
             [data release];
             [dict release];*/

        }
    }
    
    else if (request.tag == 2) {
        
        if([proxyDelegate respondsToSelector:@selector(returnData:)]){        
            
            NSArray *data = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"testCourseViewData" ofType:@"plist"]];
            
            NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"viewCourses",@"type",data,@"data", nil];
            
            [proxyDelegate returnData:dict];
            
            [data release];
            [dict release];
            
            /*NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys:LOGIN_REQUEST_FAILED,@"error", nil];
             NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"error",@"type",data,@"data", nil];
             
             [proxyDelegate returnData:dict];
             
             [data release];
             [dict release];*/
            
        }
    }
    
    else if (request.tag == 3) {
        
        if([proxyDelegate respondsToSelector:@selector(returnData:)]){        
            
            NSArray *data = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"testScheduleViewData" ofType:@"plist"]];
            
            NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"viewSchedules",@"type",data,@"data", nil];
            
            [proxyDelegate returnData:dict];
            
            [data release];
            [dict release];
            
            /*NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys:LOGIN_REQUEST_FAILED,@"error", nil];
             NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"error",@"type",data,@"data", nil];
             
             [proxyDelegate returnData:dict];
             
             [data release];
             [dict release];*/
            
        }
    }

    else if (request.tag == 4) {
        
        if([proxyDelegate respondsToSelector:@selector(returnData:)]){        
            
            NSArray *data = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"testGeneratedScheduleViewData" ofType:@"plist"]];
            
            NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"generateSchedules",@"type",data,@"data", nil];
                        
            [proxyDelegate returnData:dict];
            
            [data release];
            [dict release];
            
            /*NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys:LOGIN_REQUEST_FAILED,@"error", nil];
             NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"error",@"type",data,@"data", nil];
             
             [proxyDelegate returnData:dict];
             
             [data release];
             [dict release];*/
            
        }
    }
    
    else if (request.tag == 5) {
        
        if([proxyDelegate respondsToSelector:@selector(returnData:)]){        
            
            NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys:SAVED_TITLE,@"title",SAVED_MESSAGE,@"message", nil];
            
            NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"savedSchedule",@"type",data,@"data", nil];
            
            [proxyDelegate returnData:dict];
            
            [data release];
            [dict release];
            
            /*NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys:LOGIN_REQUEST_FAILED,@"error", nil];
             NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"error",@"type",data,@"data", nil];
             
             [proxyDelegate returnData:dict];
             
             [data release];
             [dict release];*/
            
        }
    }
    
    else {
        NSLog(@"Something has gone terribly wrong!");        
    }

}

//- (void)requestRedirected:(ASIHTTPRequest *)request{
//    
//}

// When a delegate implements this method, it is expected to process all incoming data itself
// This means that responseData / responseString / downloadDestinationPath etc are ignored
// You can have the request call a different method by setting didReceiveDataSelector
/*
 - (void)request:(ASIHTTPRequest *)request didReceiveData:(NSData *)data{
 
 }
 */

// If a delegate implements one of these, it will be asked to supply credentials when none are available
// The delegate can then either restart the request ([request retryUsingSuppliedCredentials]) once credentials have been set
// or cancel it ([request cancelAuthentication])
/*
 - (void)authenticationNeededForRequest:(ASIHTTPRequest *)request{
 
 }
 
 - (void)proxyAuthenticationNeededForRequest:(ASIHTTPRequest *)request{
 
 }
 */

-(void)showHUDWithText:(NSString *)text withSelector:(SEL)selector onTarget:(id)target withObject:(id)object{
    
    HUD = [[MBProgressHUD alloc] initWithView:[Helper getSplitViewController].view];
	[[Helper getSplitViewController].view addSubview:HUD];
    
    HUD.delegate = self;
    HUD.labelText = text;
	
    [HUD showWhileExecuting:selector onTarget:target withObject:object animated:YES];
}

#pragma mark MBProgressHUDDelegate methods

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    
    [HUD removeFromSuperview];
    [HUD release];
    HUD = nil;
}

@end
