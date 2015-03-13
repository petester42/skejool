//
//  AppDelegate.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "LoginViewController.h"
#import "TableViewCell.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UIWindow *window;
    UISplitViewController *splitViewController;
    MasterViewController *masterViewController;
    DetailViewController *detailViewController;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UISplitViewController *splitViewController;
@property (strong, nonatomic) MasterViewController *masterViewController;
@property (strong, nonatomic) DetailViewController *detailViewController;

-(void)customizeAppearance;
-(void)resetView;

@end
