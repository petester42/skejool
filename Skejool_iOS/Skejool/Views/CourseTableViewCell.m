//
//  CourseTableViewCell.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CourseTableViewCell.h"

@implementation CourseTableViewCell

@synthesize /*courseID,*/ courseName, credits;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
      /*  courseID = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 44)];
        courseID.backgroundColor = [UIColor clearColor];
        courseID.adjustsFontSizeToFitWidth = YES;
        courseID.font = [UIFont fontWithName:FONT_NAME size:20];
        courseID.textColor = DARK_GRAY;
        */
        courseName = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 554, 44)];
        courseName.backgroundColor = [UIColor clearColor];
        courseName.adjustsFontSizeToFitWidth = YES;
        courseName.font = [UIFont fontWithName:FONT_NAME size:18];
        courseName.textColor = DARK_GRAY;
        
        credits = [[UILabel alloc] initWithFrame:CGRectMake(viewWidth-130, 0, 100, 44)];
        credits.backgroundColor = [UIColor clearColor];
        credits.adjustsFontSizeToFitWidth = YES;
        credits.font = [UIFont fontWithName:FONT_NAME size:18];
        credits.textColor = DARK_GRAY;
        credits.textAlignment = UITextAlignmentRight;
        
//        [self addSubview:courseID];
        [self addSubview:courseName];
        [self addSubview:credits];
        
//        [courseID release];
        [courseName release];
        [credits release];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setUpCell:(Course *)course{
    
//    courseID.text = [dict objectForKey:@"CourseID"];
    
    if ([course.courseID isEqualToString:@""]) {
        courseName.text = course.courseName;
    }
    
    else {
        courseName.text = [NSString stringWithFormat:@"%@-%@",course.courseID,course.courseName];
    }
    
    if ([course.credits isEqualToString:@""]) {
        credits.text = @"";
    }
    
    else {
        credits.text = [NSString stringWithFormat:@"%@ Credits", course.credits];
    }
    
    if (course.completed == 1) {
//        courseID.textColor = MEDIUM_GRAY;
        courseName.textColor = MEDIUM_GRAY;
        credits.textColor = MEDIUM_GRAY;
    }
    
    else {
//        courseID.textColor = DARK_GRAY;
        courseName.textColor = DARK_GRAY;
        credits.textColor = DARK_GRAY;
    }

}

@end
