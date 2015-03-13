//
//  AddDayView.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AllDayView.h"

@implementation AllDayView

@synthesize timeTable;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        int height = frame.size.height;
        int width = frame.size.width;
        
        UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,75,height)];
        timeLabel.backgroundColor = LIGHT_GRAY;
        timeLabel.adjustsFontSizeToFitWidth = YES;
        timeLabel.font = [UIFont fontWithName:BOLD_FONT_NAME size:18];
        timeLabel.textColor = DARK_GRAY;
        timeLabel.textAlignment = UITextAlignmentCenter;
        timeLabel.text = @"All Day";
        
        [self addSubview:timeLabel];
        
        [timeLabel release];
        
        int btnWidth = (width - (timeLabel.frame.origin.x+timeLabel.frame.size.width))/5;
        
        UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(timeLabel.frame.origin.x+timeLabel.frame.size.width,0,btnWidth,height)];
        btn1.tag = 100;
        btn1.backgroundColor = LIGHT_GRAY;
        [btn1 addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(btn1.frame.origin.x+btn1.frame.size.width,0,btnWidth,height)];
        btn2.tag = 200;
        btn2.backgroundColor = LIGHT_GRAY;
        [btn2 addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(btn2.frame.origin.x+btn2.frame.size.width,0,btnWidth,height)];
        btn3.tag = 300;
        btn3.backgroundColor = LIGHT_GRAY;
        [btn3 addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(btn3.frame.origin.x+btn3.frame.size.width,0,btnWidth,height)];
        btn4.tag = 400;
        btn4.backgroundColor = LIGHT_GRAY;
        [btn4 addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btn5 = [[UIButton alloc] initWithFrame:CGRectMake(btn4.frame.origin.x+btn4.frame.size.width,0,width- (btnWidth*4 + timeLabel.frame.origin.x+timeLabel.frame.size.width),height)];
        btn5.tag = 500;
        btn5.backgroundColor = LIGHT_GRAY;
        [btn5 addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn1];
        [self addSubview:btn2];
        [self addSubview:btn3];
        [self addSubview:btn4];
        [self addSubview:btn5];
        
        [btn1 release];
        [btn2 release];
        [btn3 release];
        [btn4 release];
        [btn5 release];
        
        [self addLinesWithWidth:width andHeight:height];
        [self setColor];
    }
    
    return self;
}

-(void)addLinesWithWidth:(int)width andHeight:(int)height{
    
    UIView *line0 = [[UIView alloc] initWithFrame:CGRectMake(75, 0, 1, height)];
    line0.backgroundColor = MEDIUM_GRAY;
    
    width = (width - line0.frame.origin.x)/5;
    
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(width + line0.frame.origin.x, 0, 1, height)];
    line1.backgroundColor = MEDIUM_GRAY;
    
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(width*2 + line0.frame.origin.x, 0, 1, height)];
    line2.backgroundColor = MEDIUM_GRAY;
    
    UIView *line3 = [[UIView alloc] initWithFrame:CGRectMake(width*3 + line0.frame.origin.x, 0, 1, height)];
    line3.backgroundColor = MEDIUM_GRAY;
    
    UIView *line4 = [[UIView alloc] initWithFrame:CGRectMake(width*4 + line0.frame.origin.x, 0, 1, height)];
    line4.backgroundColor = MEDIUM_GRAY;
    
    UIView *line5 = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, 1)];
    line5.backgroundColor = DARK_GRAY;
    
    UIView *line6 = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 2, self.frame.size.width, 1)];
    line6.backgroundColor = DARK_GRAY;
    
    [self addSubview:line0];
    [self addSubview:line1];
    [self addSubview:line2];
    [self addSubview:line3];
    [self addSubview:line4];
    [self addSubview:line5];
    [self addSubview:line6];
    
    [line0 release];
    [line1 release];
    [line2 release];
    [line3 release];
    [line4 release];
    [line5 release];
    [line6 release];
}


-(void)selectButton:(id)sender{
    
    int day = ([sender tag]/100)-1;
    
    NSMutableArray *array = [[[[Data sharedInstance] TimeConstraints] objectForKey:@"allDay"] mutableCopy];    
    
    if ([[array objectAtIndex:day] boolValue] == YES) {
        UIButton *btn = (UIButton *)[self viewWithTag:[sender tag]];
        btn.backgroundColor = LIGHT_GRAY;
        
        [array replaceObjectAtIndex:day withObject:[NSNumber numberWithBool:NO]];
        
        [self removeAllTimesForDay:day];
    }
    
    else {
        UIButton *btn = (UIButton *)[self viewWithTag:[sender tag]];
        btn.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        
        [array replaceObjectAtIndex:day withObject:[NSNumber numberWithBool:YES]];
        
        [self addAllTimesForDay:day];
    }
    
    [[[Data sharedInstance] TimeConstraints] setValue:array forKey:@"allDay"];
    [array release];
    
}

-(void)removeAllTimesForDay:(int)day{
    
    NSMutableArray *array = [[[[Data sharedInstance] TimeConstraints] objectForKey:@"cells"] mutableCopy];    
    
    for (NSMutableArray *cellArray in array) {
        [cellArray replaceObjectAtIndex:day withObject:[NSNumber numberWithBool:NO]];
    }
    
    [[[Data sharedInstance] TimeConstraints] setValue:array forKey:@"cells"];
    
    [array release];
    
    [timeTable reloadData];
}

-(void)addAllTimesForDay:(int)day{
    
    NSMutableArray *array = [[[[Data sharedInstance] TimeConstraints] objectForKey:@"cells"] mutableCopy];    
    
    for (NSMutableArray *cellArray in array) {
        [cellArray replaceObjectAtIndex:day withObject:[NSNumber numberWithBool:YES]];
    }
    
    [[[Data sharedInstance] TimeConstraints] setValue:array forKey:@"cells"];
    
    [array release];
    
    [timeTable reloadData];
}

-(void)setColor{
    
    for (int i = 0; i<5; ++i) {
        
        int day = ((i+1)*100);
        
        NSMutableArray *array = [[[[Data sharedInstance] TimeConstraints] objectForKey:@"allDay"] mutableCopy];    
        
        if ([[array objectAtIndex:i] boolValue] == NO) {
            UIButton *btn = (UIButton *)[self viewWithTag:day];
            btn.backgroundColor = LIGHT_GRAY;
            
        }
        
        else {
            UIButton *btn = (UIButton *)[self viewWithTag:day];
            btn.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
            
        }
    }
}

-(void)reloadAllDay{  
        
    for (int i = 0; i < [[[[Data sharedInstance] TimeConstraints] objectForKey:@"allDay"] count]; ++i) {
        
        if ([[[[[Data sharedInstance] TimeConstraints] objectForKey:@"allDay"] objectAtIndex:i] boolValue] == YES) {
            UIButton *btn = (UIButton *)[self viewWithTag:(i+1)*100];
            btn.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        }
        
        else {
            UIButton *btn = (UIButton *)[self viewWithTag:(i+1)*100];
            btn.backgroundColor = LIGHT_GRAY;
            
        }
        
    }
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
