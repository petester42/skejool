//
//  ProxyRequestHandler.h
//  Nominator
//
//  Created by Pierre-Marc Airoldi on 11-09-06.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONKit.h"
#import "MBProgressHUD.h"

@protocol ProxyDelegate <NSObject>
@required
-(void)returnData:(NSDictionary *)data;
@end

@interface ProxyRequestHandler : NSObject  <ASIHTTPRequestDelegate, MBProgressHUDDelegate> {
    id <ProxyDelegate> proxyDelegate; 
    MBProgressHUD *HUD;
}

@property (nonatomic, assign) id <ProxyDelegate> proxyDelegate;

-(void)sendRequest:(ASIFormDataRequest *)request withDelegate:(id)delegate;
-(void)showHUDWithText:(NSString *)text withSelector:(SEL)selector onTarget:(id)target withObject:(id)object;

@end
