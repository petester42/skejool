//
//  ClassView.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-13.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ClassView.h"
#define labelHeight 20
#define fontSize 16

@implementation ClassView

@synthesize startColor, endColor, labelView, courseID, location, section,startEndTime;

- (id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        labelView = [[UIView alloc] initWithFrame:CGRectMake(0,frame.size.height/2,frame.size.width,4*labelHeight)];
        
        courseID = [[UILabel alloc] initWithFrame:CGRectMake(4,0,labelView.frame.size.width-8,labelHeight)];
        courseID.backgroundColor = [UIColor clearColor];
        courseID.adjustsFontSizeToFitWidth = YES;
        courseID.font = [UIFont fontWithName:BOLD_FONT_NAME size:fontSize];
        courseID.textColor = [UIColor whiteColor];
        courseID.textAlignment = UITextAlignmentCenter;

        section = [[UILabel alloc] initWithFrame:CGRectMake(4,labelHeight,labelView.frame.size.width-8,labelHeight)];
        section.backgroundColor = [UIColor clearColor];
        section.adjustsFontSizeToFitWidth = YES;
        section.font = [UIFont fontWithName:BOLD_FONT_NAME size:fontSize];
        section.textColor = [UIColor whiteColor];
        section.textAlignment = UITextAlignmentCenter;
        
        location = [[UILabel alloc] initWithFrame:CGRectMake(4,2*labelHeight,labelView.frame.size.width-8,labelHeight)];
        location.backgroundColor = [UIColor clearColor];
        location.adjustsFontSizeToFitWidth = YES;
        location.font = [UIFont fontWithName:BOLD_FONT_NAME size:fontSize];
        location.textColor = [UIColor whiteColor];
        location.textAlignment = UITextAlignmentCenter;
        
        startEndTime = [[UILabel alloc] initWithFrame:CGRectMake(4,3*labelHeight,labelView.frame.size.width-8,labelHeight)];
        startEndTime.backgroundColor = [UIColor clearColor];
        startEndTime.adjustsFontSizeToFitWidth = YES;
        startEndTime.font = [UIFont fontWithName:BOLD_FONT_NAME size:fontSize];
        startEndTime.textColor = [UIColor whiteColor];
        startEndTime.textAlignment = UITextAlignmentCenter;
        
        [labelView addSubview:courseID];
        [labelView addSubview:section];
        [labelView addSubview:location];
        [labelView addSubview:startEndTime];
        
        [courseID release];
        [section release];
        [location release];
        [startEndTime release];
        
        [self addSubview:labelView];
        [labelView release];
        
      /*  UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height, frame.size.width, 1)];
        line.backgroundColor = DARK_GRAY;
        
        UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, -1, frame.size.width, 1)];
        line1.backgroundColor = DARK_GRAY;
        
        UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(-1, -1, 1, frame.size.height+1)];
        line2.backgroundColor = DARK_GRAY;
        
        UIView *line3 = [[UIView alloc] initWithFrame:CGRectMake(frame.size.width, -1, 1, frame.size.height+1)];
        line3.backgroundColor = DARK_GRAY;
        
        [self addSubview:line];
        [self addSubview:line1];
        [self addSubview:line2];
        [self addSubview:line3];
        
        [line release];
        [line1 release];
        [line2 release];
        [line3 release];
       */
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame andCourse:(Course *)course atTime:(Time *)time{
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        labelView = [[UIView alloc] initWithFrame:CGRectMake(0,frame.size.height/2,frame.size.width,4*labelHeight)];
        labelView.layer.anchorPoint = CGPointMake(0.5, 1.0);       
        
        courseID = [[UILabel alloc] initWithFrame:CGRectMake(4,0,labelView.frame.size.width-8,labelHeight)];
        courseID.backgroundColor = [UIColor clearColor];
        courseID.adjustsFontSizeToFitWidth = YES;
        courseID.font = [UIFont fontWithName:BOLD_FONT_NAME size:fontSize];
        courseID.textColor = [UIColor whiteColor];
        courseID.textAlignment = UITextAlignmentCenter;
        
        section = [[UILabel alloc] initWithFrame:CGRectMake(4,labelHeight,labelView.frame.size.width-8,labelHeight)];
        section.backgroundColor = [UIColor clearColor];
        section.adjustsFontSizeToFitWidth = YES;
        section.font = [UIFont fontWithName:BOLD_FONT_NAME size:fontSize];
        section.textColor = [UIColor whiteColor];
        section.textAlignment = UITextAlignmentCenter;
        
        location = [[UILabel alloc] initWithFrame:CGRectMake(4,2*labelHeight,labelView.frame.size.width-8,labelHeight)];
        location.backgroundColor = [UIColor clearColor];
        location.adjustsFontSizeToFitWidth = YES;
        location.font = [UIFont fontWithName:BOLD_FONT_NAME size:fontSize];
        location.textColor = [UIColor whiteColor];
        location.textAlignment = UITextAlignmentCenter;
        
        startEndTime = [[UILabel alloc] initWithFrame:CGRectMake(4,3*labelHeight,labelView.frame.size.width-8,labelHeight)];
        startEndTime.backgroundColor = [UIColor clearColor];
        startEndTime.adjustsFontSizeToFitWidth = YES;
        startEndTime.font = [UIFont fontWithName:BOLD_FONT_NAME size:fontSize];
        startEndTime.textColor = [UIColor whiteColor];
        startEndTime.textAlignment = UITextAlignmentCenter;
        
        [labelView addSubview:courseID];
        [labelView addSubview:section];
        [labelView addSubview:location];
        [labelView addSubview:startEndTime];
        
        [courseID release];
        [section release];
        [location release];
        [startEndTime release];
        
        [self addSubview:labelView];
        [labelView release];
        
      /*  UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height, frame.size.width, 1)];
        line.backgroundColor = DARK_GRAY;
        
        UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, -1, frame.size.width, 1)];
        line1.backgroundColor = DARK_GRAY;
        
        UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(-1, -1, 1, frame.size.height+2)];
        line2.backgroundColor = DARK_GRAY;
        
        UIView *line3 = [[UIView alloc] initWithFrame:CGRectMake(frame.size.width, -1, 1, frame.size.height+2)];
        line3.backgroundColor = DARK_GRAY;
        
        [self addSubview:line];
        [self addSubview:line1];
        [self addSubview:line2];
        [self addSubview:line3];
        
        [line release];
        [line1 release];
        [line2 release];
        [line3 release];
*/
        [self setDataFromCourse:course atTime:time];
    }
    
    return self;
}

-(void)setDataFromCourse:(Course *)course atTime:(Time*)time{
  
    courseID.text = course.courseID;
    section.text = [NSString stringWithFormat:@"%@ %@",[time type],[time section]];
    location.text = [time location];
    startEndTime.text = [NSString stringWithFormat:@"%@-%@",[time startTime], [time endTime]];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = {0.0, 1.0};
    
    NSArray *colors = [NSArray arrayWithObjects:(id)[startColor CGColor], (id)[endColor CGColor], nil];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef) colors, locations);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

@end
