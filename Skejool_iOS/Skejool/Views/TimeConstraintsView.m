//
//  TimeConstraintsView.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TimeConstraintsView.h"

@implementation TimeConstraintsView

@synthesize title, timeTable;

- (id)initWithFrame:(CGRect)frame
{
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(clearConstraints:) 
                                                 name:@"clearConstraints" object:nil];
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor clearColor]; 
        
        title = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/2, 0, frame.size.width, 40)];
        title.backgroundColor = [UIColor clearColor];
        title.textAlignment = UITextAlignmentCenter;
        title.font = [UIFont fontWithName:BOLD_FONT_NAME size:20];
        title.adjustsFontSizeToFitWidth = YES;
        title.textColor = TEXT_COLOR;
        title.text = TIME_CONSTRAINTS_TITLE;
        title.layer.anchorPoint = CGPointMake(1.0,0.5);
        
        timeTable = [[TimeTable alloc] initWithFrameForConstraints:CGRectMake(10, title.frame.origin.y + title.frame.size.height, frame.size.width-20, frame.size.height - (title.frame.origin.y + title.frame.size.height + 10))];
        timeTable.selection = YES;
        
        [self addSubview:timeTable];
        [self addSubview:title];
       
        [timeTable release];
        [title release];

    }
    return self;
}

-(void)clearConstraints:(id)sender{
    [timeTable.table reloadData];
    [[timeTable allDayView] reloadAllDay];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"clearConstraints" object:nil];
    [super dealloc];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
