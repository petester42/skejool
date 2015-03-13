//
//  GeneratedScheduleView.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-30.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeTable.h"

@interface GeneratedScheduleView : UIView {

    int index;
    UILabel *title;
    UIButton *save;
    TimeTable *timeTable;
}

@property (nonatomic) int index;
@property (nonatomic,retain) UILabel *title;
@property (nonatomic,retain) UIButton *save;
@property (nonatomic,retain) TimeTable *timeTable;

-(void)saveSchedule:(id)sender;

@end
