//
//  TimeTableCell.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-07.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeTableCell : UITableViewCell{

    UILabel *timeLabel;
    int position;
    int totalWidth;
    bool selectionON;
    UIButton *btn1;
    UIButton *btn2;
    UIButton *btn3;
    UIButton *btn4;
    UIButton *btn5;
    
}

@property (nonatomic, retain) UILabel *timeLabel;
@property (nonatomic) int position;
@property (nonatomic) int totalWidth;
@property (nonatomic) bool selectionON;
@property (nonatomic, retain) UIButton *btn1;
@property (nonatomic, retain) UIButton *btn2;
@property (nonatomic, retain) UIButton *btn3;
@property (nonatomic, retain) UIButton *btn4;
@property (nonatomic, retain) UIButton *btn5;

-(void)setUpCell:(NSString *)time;
-(void)initWithWidth:(int)width andHeight:(int)height andSelection:(BOOL)on atPosition:(int)index;
-(void)addLinesWithWidth:(int)width andHeight:(int)height;
-(void)selectButton:(id)sender;
-(void)setColor;

@end
