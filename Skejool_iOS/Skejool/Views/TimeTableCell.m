//
//  TimeTableCell.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-07.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TimeTableCell.h"

@implementation TimeTableCell

@synthesize timeLabel,position,btn1,btn2,btn3,btn4,btn5, totalWidth, selectionON;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code                        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)initWithWidth:(int)width andHeight:(int)height andSelection:(BOOL)on atPosition:(int)index{
    
    position = index;
    selectionON = on;
    
    timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,75,height)];
    timeLabel.backgroundColor = [UIColor clearColor];
    timeLabel.adjustsFontSizeToFitWidth = YES;
    timeLabel.font = [UIFont fontWithName:BOLD_FONT_NAME size:18];
    timeLabel.textColor = DARK_GRAY;
    timeLabel.textAlignment = UITextAlignmentCenter;
    
    [self.contentView addSubview:timeLabel];
    
    int btnWidth = (width - (timeLabel.frame.origin.x+timeLabel.frame.size.width))/5;
    
    btn1 = [[UIButton alloc] initWithFrame:CGRectMake(timeLabel.frame.origin.x+timeLabel.frame.size.width,0,btnWidth,height)];
    btn1.tag = 1000;
    [btn1 addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
    
    btn2 = [[UIButton alloc] initWithFrame:CGRectMake(btn1.frame.origin.x+btn1.frame.size.width,0,btnWidth,height)];
    btn2.tag = 2000;
    [btn2 addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
    
    btn3 = [[UIButton alloc] initWithFrame:CGRectMake(btn2.frame.origin.x+btn2.frame.size.width,0,btnWidth,height)];
    btn3.tag = 3000;
    [btn3 addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
    
    btn4 = [[UIButton alloc] initWithFrame:CGRectMake(btn3.frame.origin.x+btn3.frame.size.width,0,btnWidth,height)];
    btn4.tag = 4000;
    [btn4 addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
    
    btn5 = [[UIButton alloc] initWithFrame:CGRectMake(btn4.frame.origin.x+btn4.frame.size.width,0,width- (btnWidth*4 + timeLabel.frame.origin.x+timeLabel.frame.size.width),height)];
    btn5.tag = 5000;
    [btn5 addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
    
    if (on == YES) {
        btn1.enabled = YES;
        btn2.enabled = YES;
        btn3.enabled = YES;
        btn4.enabled = YES;
        btn5.enabled = YES;
    }
    
    else {
        btn1.enabled = NO;
        btn2.enabled = NO;
        btn3.enabled = NO;
        btn4.enabled = NO;
        btn5.enabled = NO;
    }
    
    [self.contentView addSubview:btn1];
    [self.contentView addSubview:btn2];
    [self.contentView addSubview:btn3];
    [self.contentView addSubview:btn4];
    [self.contentView addSubview:btn5];
    
    [self addLinesWithWidth:width andHeight:height];
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
    
    [self.contentView addSubview:line0];
    [self.contentView addSubview:line1];
    [self.contentView addSubview:line2];
    [self.contentView addSubview:line3];
    [self.contentView addSubview:line4];
    
    [line0 release];
    [line1 release];
    [line2 release];
    [line3 release];
    [line4 release];
}

-(void)setUpCell:(NSString *)time{
    timeLabel.text = time;
    
    if (selectionON == YES) {
        [self setColor];
    }
}

-(void)selectButton:(id)sender{
    
    int day = ([sender tag]/1000)-1;
    
    NSMutableArray *array = [[[[Data sharedInstance] TimeConstraints] objectForKey:@"cells"] mutableCopy];    
    
    if ([[[array objectAtIndex:position] objectAtIndex:day] boolValue] == YES) {
        UIButton *btn = (UIButton *)[self viewWithTag:[sender tag]];
        btn.backgroundColor = LIGHT_GRAY;
        
        [[array objectAtIndex:position] replaceObjectAtIndex:day withObject:[NSNumber numberWithBool:NO]];
        
    }
    
    else {
        UIButton *btn = (UIButton *)[self viewWithTag:[sender tag]];
        btn.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        
        [[array objectAtIndex:position] replaceObjectAtIndex:day withObject:[NSNumber numberWithBool:YES]];
        
    }
    
    [[[Data sharedInstance] TimeConstraints] setValue:array forKey:@"cells"];
    [array release];
    
}

-(void)setColor{
    
    for (int i = 0; i < 5; ++i) {
        
        if ([[[[[[Data sharedInstance] TimeConstraints] objectForKey:@"cells"] objectAtIndex:position] objectAtIndex:i] boolValue] == NO) {
            UIButton *btn = (UIButton *)[self viewWithTag:((i+1)*1000)];
            btn.backgroundColor = LIGHT_GRAY;
        }
        
        else {
            UIButton *btn = (UIButton *)[self viewWithTag:((i+1)*1000)];
            btn.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
            
        }
        
    }
}

@end
