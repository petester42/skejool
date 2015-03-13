//
//  TimeConstraintsView.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeTable.h"

@interface TimeConstraintsView : UIView {
    
    UILabel *title;
    TimeTable *timeTable;
}

@property (nonatomic, retain) UILabel *title;
@property (nonatomic, retain) TimeTable *timeTable;

-(void)clearConstraints:(id)sender;

@end
