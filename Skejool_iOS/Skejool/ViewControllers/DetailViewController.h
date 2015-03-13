//
//  DetailViewController.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewCourseView.h"
#import "ViewSequenceView.h"
#import "ViewSchedulesView.h"
#import "TimeConstraintsView.h"
#import "CreditConstraintsView.h"
#import "GeneratedScheduleView.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>{

    UIView *detailItem;
}

@property (strong, nonatomic) UIView *detailItem;

-(void)switchToView:(id)newView;
-(void)switchToViewSequenceAnimated:(BOOL)animated;
-(void)switchToNoActionAnimated:(BOOL)animated;
-(void)switchToViewCoursesAnimated:(BOOL)animated;
-(void)switchToViewSchedulesAnimated:(BOOL)animated;
-(void)switchToViewTimeConstraintAnimated:(BOOL)animated;
-(void)switchToViewCreditConstraintAnimated:(BOOL)animated;
-(void)switchToScheduleAnimated:(BOOL)animated withIndex:(id)index;

-(void)getSequenceDone:(id)sender;
-(void)getCoursesDone:(id)sender;
-(void)getSchedulesDone:(id)sender;
-(void)getTimeConstraints:(id)sender;
-(void)getCreditConstraints:(id)sender;
-(void)getScheduleForIndex:(id)sender;

@end
