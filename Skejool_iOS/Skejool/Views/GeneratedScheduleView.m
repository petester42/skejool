//
//  GeneratedScheduleView.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-30.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GeneratedScheduleView.h"

@implementation GeneratedScheduleView

@synthesize index, title, save, timeTable;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        title = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/2, 12, self.frame.size.width - 220, 30)];
        title.backgroundColor = [UIColor clearColor];
        title.textAlignment = UITextAlignmentCenter;
        title.font = [UIFont fontWithName:BOLD_FONT_NAME size:30];
        title.adjustsFontSizeToFitWidth = YES;
        title.textColor = TEXT_COLOR;
        title.layer.anchorPoint = CGPointMake(1.0,0.5);
        
        save = [[UIButton alloc] initWithFrame:CGRectMake(title.frame.origin.x + title.frame.size.width + 10, title.frame.origin.y, (self.frame.size.width - 10) - (title.frame.origin.x + title.frame.size.width + 10) - 2, 30)];
        [save setBackgroundImage:[Helper imageWithColor:LIGHT_GRAY] forState:UIControlStateNormal];
        [save setBackgroundImage:[Helper imageWithColor:DARK_RED] forState:UIControlStateHighlighted];        
        [save addTarget:self action:@selector(saveSchedule:) forControlEvents:UIControlEventTouchUpInside];
        [save.titleLabel setFont:[UIFont fontWithName:BOLD_FONT_NAME size:20]];
        [save setTitleColor:DARK_GRAY forState:UIControlStateNormal];
        [save setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [save setTitle:@"Save" forState:UIControlStateNormal];
        
        CALayer *capa = save.layer;
        CGRect bounds = capa.bounds;
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds 
                                                       byRoundingCorners:UIRectCornerAllCorners
                                                             cornerRadii:CGSizeMake(10.0, 10.0)];
        
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = bounds;
        maskLayer.path = maskPath.CGPath;
        
        capa.mask = maskLayer;
        
        
        timeTable = [[TimeTable alloc] initWithFrame:CGRectMake(10, title.frame.size.height + title.frame.origin.y*2, frame.size.width-20, frame.size.height - (title.frame.size.height + title.frame.origin.y*2) - 10)];
        timeTable.selection = NO;
        
        [self addSubview:title];
        [self addSubview:timeTable];
        [self addSubview:save];
        
        [save release];
        [timeTable release];
        [title release];
    }
    
    return self;
}

-(void)setIndex:(int)_index{
    [timeTable setUpSchedule:[[[Data sharedInstance] GeneratedSchedules] objectAtIndex:_index]];
    title.text = [[[[Data sharedInstance] GeneratedSchedules] objectAtIndex:_index] semester];
}

-(void)saveSchedule:(id)sender{
    
    [Proxy saveScheduleForUser:[[[Data sharedInstance] loginData] userID] withSession:[[[Data sharedInstance] loginData] sessionID] andSchedule:[[[Data sharedInstance] GeneratedSchedules] objectAtIndex:index]];
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
