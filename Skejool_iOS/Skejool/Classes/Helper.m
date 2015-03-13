//
//  Helper.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-10.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Helper.h"
#import "AppDelegate.h"

@implementation Helper

+(UIImage *)getLogoImage{
    
    Data *data = [Data sharedInstance];
    
    return [UIImage imageNamed:[data.images objectForKey:@"logo"]];
    
}

+(UIImage *)getBarcodeImage{
    
    Data *data = [Data sharedInstance];
    
    return [UIImage imageNamed:[data.images objectForKey:@"barcodeImage"]];
}

+(void)showLoginViewAnimated:(BOOL)animated{
    
//    [[NSUserDefaults standardUserDefaults] setValue:@"0" forKey:@"LoggedIn"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
        
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [loginViewController release];
    
    navigationController.modalPresentationStyle = UIModalPresentationFullScreen;
    navigationController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    navigationController.navigationBarHidden = YES;
    
    [delegate.splitViewController presentViewController:navigationController animated:animated completion:^{
        
        [[Data sharedInstance] clearData];

        if (animated == YES) {
            
            [delegate resetView];
        }
        
        else {
            [delegate resetView];
        }
    }];
    
    [navigationController release];
}

+(BOOL)getInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
    
}

+(UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+(UIImage *)getGearImage{
    Data *data = [Data sharedInstance];
    
    return [UIImage imageNamed:[data.images objectForKey:@"gear"]];
}

+(UIImage *)getBackImage{
    Data *data = [Data sharedInstance];
    
    return [UIImage imageNamed:[data.images objectForKey:@"back"]];
}

+(UIImage *)getTextColorImage{
    Data *data = [Data sharedInstance];
    
    return [UIImage imageNamed:[data.images objectForKey:@"textColor"]];
}

+(UIImage *)getNoActionImage{
    Data *data = [Data sharedInstance];
    
    return [UIImage imageNamed:[data.images objectForKey:@"noActionSelected"]];
}

+(DetailViewController *)getDetailViewContoller{
  
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];

    return delegate.detailViewController;
}

+(UISplitViewController *)getSplitViewController{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    return delegate.splitViewController;
}

+(NSArray *)setSequence:(NSArray *)array{
    
    NSMutableArray *sequenceArray = [[[NSMutableArray alloc] init] autorelease];
    
    for (NSDictionary *dict in array) {
        NSString *header = [dict objectForKey:@"header"];
        
        NSMutableArray *dataArray = [[NSMutableArray alloc] init];
                                                                        
        for (NSDictionary *dataDict in [dict objectForKey:@"data"]) {
            
            Course *course = [[Course alloc] initWithDictionary:dataDict];
            [dataArray addObject:course];
            [course release];
            
        }
            
        [sequenceArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:header,@"header",dataArray,@"data", nil]];
        
        [dataArray release];
    }
        
    return [NSArray arrayWithArray:sequenceArray];
}

+(NSArray *)setCourses:(NSArray *)array{
    
    NSMutableArray *courseArray = [[[NSMutableArray alloc] init] autorelease];
    
    for (NSDictionary *dict in array) {
        NSString *header = [dict objectForKey:@"header"];
        
        NSMutableArray *dataArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dataDict in [dict objectForKey:@"data"]) {
            
            Course *course = [[Course alloc] initWithDictionary:dataDict];
            [dataArray addObject:course];
            [course release];
            
        }
        
        [courseArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:header,@"header",dataArray,@"data", nil]];
        
        [dataArray release];
    }
    
    return [NSArray arrayWithArray:courseArray];
}

+(NSArray *)setSchedules:(NSArray *)array{
    
    NSMutableArray *scheduleArray = [[[NSMutableArray alloc] init] autorelease];
    
    for (NSDictionary *dict in array) {
        
        NSString *semester = [dict objectForKey:@"semester"];
        
        NSMutableArray *courses = [[NSMutableArray alloc] init];
        
        for (NSDictionary *courseData in [dict objectForKey:@"courses"]) {
           
            Course *course = [[Course alloc] initWithDictionary:courseData];
            [courses addObject:course];
            [course release];
        }
        
        Schedule *schedule = [[Schedule alloc] initWithDictionary:[NSDictionary dictionaryWithObjectsAndKeys:semester,@"semester",courses,@"courses", nil]];
        [scheduleArray addObject:schedule];
        [schedule release];
        [courses release];
    }
        
    return [NSArray arrayWithArray:scheduleArray];
}

+(CGRect)getFrameForTime:(Time *)time withWidth:(int)width{
    
    int startHour = [[time.startTime stringByPaddingToLength:[time.startTime rangeOfString:@":"].location withString:@"" startingAtIndex:0] intValue];
    int startMinute = [[time.startTime stringByReplacingCharactersInRange:NSMakeRange(0, [time.startTime rangeOfString:@":"].location+1) withString:@""] intValue];
    int endHour = [[time.endTime stringByPaddingToLength:[time.endTime rangeOfString:@":"].location withString:@"" startingAtIndex:0] intValue];
    int endMinute = [[time.endTime stringByReplacingCharactersInRange:NSMakeRange(0, [time.endTime rangeOfString:@":"].location+1) withString:@""] intValue];
    
    int timeLabel = 75;
    int btnWidth = (width - timeLabel)/5;

    int originX = 0;
    int originY = 0;
    int theWidth = 0;
    int theHeight = 0;
    
    if ([time.weekDay isEqualToString:@"Mon"]) {
     
        originX = timeLabel + 1;
        theWidth = btnWidth - 1;
    }
    
    else if ([time.weekDay isEqualToString:@"Tue"]) {
        originX = timeLabel + btnWidth + 1;
        theWidth = btnWidth - 1;
    }
    
    else if ([time.weekDay isEqualToString:@"Wed"]) {
        originX = timeLabel + 2 * btnWidth + 1;
        theWidth = btnWidth - 1;
    }
    
    else if ([time.weekDay isEqualToString:@"Thu"]) {
        originX = timeLabel + 3 * btnWidth + 1;
        theWidth = btnWidth - 1;
    }
    
    else if ([time.weekDay isEqualToString:@"Fri"]) {
        originX = timeLabel + 4 * btnWidth + 1;
        theWidth = width - (btnWidth*4 + timeLabel) - 1;
    }
    
    else {
        originX = 0;
        theWidth = 0;
    }

    originY = (4*cell_height*startHour) + ((cell_height/3)*(startMinute/5));
    theHeight = ((4*cell_height*endHour) + ((cell_height/3)*(endMinute/5))) - originY - 1;
    CGRect frame = CGRectMake(originX,originY,theWidth,theHeight);
    
    return frame;
}

+(UIColor *)getColor:(NSDictionary *)dict{

    return [UIColor colorWithRed:[[dict objectForKey:@"r"] intValue]/255.0 green:[[dict objectForKey:@"g"] intValue]/255.0 blue:[[dict objectForKey:@"b"] intValue]/255.0 alpha:1.0];
}

+(CGRect)getFrameToScrollForTime:(NSDate *)time withHeight:(int)height{
    
    NSDateFormatter *timeFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [timeFormatter setDateFormat:@"h:mm"];
    
    int startHour = [[[timeFormatter stringFromDate:time] stringByPaddingToLength:[[timeFormatter stringFromDate:time] rangeOfString:@":"].location withString:@"" startingAtIndex:0] intValue];
    int startMinute = [[[timeFormatter stringFromDate:time] stringByReplacingCharactersInRange:NSMakeRange(0, [[timeFormatter stringFromDate:time] rangeOfString:@":"].location+1) withString:@""] intValue];

    int originY = (4*cell_height*startHour) + ((cell_height/3)*(startMinute/5));
    
    CGRect frame = CGRectMake(0,originY,1,height);
    
    return frame;
}

@end
