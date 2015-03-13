//
//  Constants.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-18.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Constants.h"

UIColor * const TEXT_COLOR = [UIColor colorWithPatternImage:[Helper getTextColorImage]];
UIColor * const LIGHT_GRAY = [UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1.0];
UIColor * const MEDIUM_GRAY = [UIColor colorWithRed:139/255.0 green:139/255.0 blue:139/255.0 alpha:1.0];
UIColor * const DARK_GRAY = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
UIColor * const LIGHT_RED = [UIColor colorWithRed:153/255.0 green:4/255.0 blue:4/255.0 alpha:1.0];
UIColor * const DARK_RED = [UIColor colorWithRed:118/255.0 green:3/255.0 blue:3/255.0 alpha:1.0];
NSString * const APP_NAME = @"Skejool";
NSString * const MEMBERS = @"Pierre-Marc Airoldi\nJean-Robert Harvey\nHichem Hassania\nEugeniu Simon\nPaul Timoce\nJacky Tong\nCesar Villao";
NSString * const FONT_NAME = @"HelveticaNeue";
NSString * const BOLD_FONT_NAME = @"HelveticaNeue-Bold";
NSString * const ITALIC_FONT_NAME = @"HelveticaNeue-Italic";
NSString * const LOGO_FONT = @"ArialRoundedMTBold";
NSString * const API_LINK = @"http://localhost:8080/skejool/";
NSString * const NAVIGATION_TITLE = @"9601643";
NSString * const LOGIN_ERROR = @"You have not entered the required information into the username and password fields.\n\nPlease enter your information into these fields.";
NSString * const LOGIN_REQUEST_FAILED = @"This is the login request error!";
NSString * const TIME_CONSTRAINTS_TITLE = @"Tap Cells to Enter Time Constraints"; 
NSString * const CLEAR_CONSTRAINTS_ALERT_TITLE = @"Alert!";
NSString * const CLEAR_CONSTRAINTS_ALERT_MESSAGE = @"Are you sure you want to clear your constraints?";
NSString * const CREDIT_CONSTRAINTS_TITLE = @"Scroll Picker to Enter Credit Constraints";
NSString * const CREDIT_CONSTRAINTS_INFO = @"Note: If you want to remain a full time student then you must take at least minimum amount of credits per semester.\n\nRegistration for the Summer session: 12 credits.\nRegistration for Fall session only: 12 credits or more.\nRegistration for Winter session only: 12 credits or more.\nRegistration for both Fall and Winter sessions: 24 credits or more.";
extern NSString * const SAVED_TITLE = @"Saved!";
extern NSString * const SAVED_MESSAGE = @"You have successfully saved your schedule.";