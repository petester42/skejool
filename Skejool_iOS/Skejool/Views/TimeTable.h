//
//  TimeTable.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-07.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeTableCell.h"
#import "Schedule.h"
#import "Course.h"
#import "ClassView.h"
#import "AllDayView.h"

@interface TimeTable : UIView <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate> {
    
    UITableView *table;
    UIScrollView *scroll;
    UIView *classesView;
    AllDayView *allDayView;
    BOOL selection;
}

- (id)initWithFrameForConstraints:(CGRect)frame;

@property (nonatomic, retain) UITableView *table;
@property (nonatomic, retain) UIScrollView *scroll;
@property (nonatomic, retain) UIView *classesView;
@property (nonatomic, retain) AllDayView *allDayView;
@property (nonatomic) BOOL selection;

-(void)setUpSchedule:(Schedule *)schedule;

@end
