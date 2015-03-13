//
//  Helper.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-10.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "NavigationHeader.h"
#import "Schedule.h"
#import "Course.h"

@interface Helper : NSObject

+(UIImage *)getLogoImage;
+(UIImage *)getBarcodeImage;
+(UIImage *)imageWithColor:(UIColor *)color;
+(UIImage *)getGearImage;
+(UIImage *)getBackImage;
+(UIImage *)getTextColorImage;
+(UIImage *)getNoActionImage;

+(DetailViewController *)getDetailViewContoller;
+(UISplitViewController *)getSplitViewController;
+(void)showLoginViewAnimated:(BOOL)animated;
+(BOOL)getInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;
+(NSArray *)setSequence:(NSArray *)array;
+(NSArray *)setCourses:(NSArray *)array;
+(NSArray *)setSchedules:(NSArray *)array;
+(CGRect)getFrameForTime:(Time *)time withWidth:(int)width;
+(UIColor *)getColor:(NSDictionary *)dict;
+(CGRect)getFrameToScrollForTime:(NSDate *)time withHeight:(int)height;

@end
