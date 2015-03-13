//
//  AppDelegate.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize splitViewController = _splitViewController;
@synthesize detailViewController,masterViewController;

- (void)dealloc
{
    [_window release];
    [_splitViewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [TestFlight takeOff:@"151bef1bf18f2f456fe00733a8caceee_MjM5NjEyMDEyLTAyLTE1IDIzOjU3OjM1Ljk0MDcwOA"];
    
//    [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"LoggedIn"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self customizeAppearance];
    
    [Proxy sharedInstance];
    [Data sharedInstance];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    masterViewController = [[MasterViewController alloc] initWithNibName:@"MasterViewController" bundle:nil];
    UINavigationController *masterNavigationController = [[[UINavigationController alloc] initWithRootViewController:masterViewController] autorelease];
    
    [masterViewController release];
    
    detailViewController = [[[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil] autorelease];

    masterNavigationController.navigationBarHidden = YES;
    
    self.splitViewController = [[[UISplitViewController alloc] init] autorelease];
    self.splitViewController.delegate = detailViewController;
    self.splitViewController.viewControllers = [NSArray arrayWithObjects:masterNavigationController, detailViewController, nil];
    
        
    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 748)];
    backgroundImage.image = [UIImage imageNamed:@"Background-Main.png"];
    
    [self.splitViewController.view insertSubview:backgroundImage atIndex:0];
    
    [backgroundImage release];
        
    self.window.rootViewController = self.splitViewController;
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
    
    if ([[[[Data sharedInstance] loginData] sessionID] isEqualToString:@""]) {
        [Helper showLoginViewAnimated:NO];
    }
    
   /* if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"LoggedIn"] isEqualToString:@"0"]) {
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"LoggedIn"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [Helper showLoginViewAnimated:NO];
       
    }*/
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[Data sharedInstance] clearData];
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

#pragma mark - User Interface Customization

- (void)customizeAppearance {
    
    [[UITextField appearanceWhenContainedIn:[LoginViewController class], nil] setBackgroundColor:[UIColor clearColor]];
    [[UITextField appearanceWhenContainedIn:[LoginViewController class], nil] setTextColor:DARK_GRAY];
    [[UITextField appearanceWhenContainedIn:[LoginViewController class], nil] setFont:[UIFont fontWithName:BOLD_FONT_NAME size:25]];
}

-(void)resetView{
        
    [[self.splitViewController.viewControllers objectAtIndex:0] popToRootViewControllerAnimated:NO];
    [[self.splitViewController.viewControllers objectAtIndex:0] reloadData];
    [[self.splitViewController.viewControllers objectAtIndex:1] switchToNoActionAnimated:NO];
}

@end
