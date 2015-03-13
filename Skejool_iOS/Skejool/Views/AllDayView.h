//
//  AddDayView.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllDayView : UIView {
   
    UITableView *timeTable;
}

@property (nonatomic, retain) UITableView *timeTable;

-(void)selectButton:(id)sender;
-(void)removeAllTimesForDay:(int)day;
-(void)addAllTimesForDay:(int)day;
-(void)setColor;
-(void)reloadAllDay;

@end
