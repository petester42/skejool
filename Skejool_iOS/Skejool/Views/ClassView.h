//
//  ClassView.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-13.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"
#import "Time.h"

@interface ClassView : UIView {
    
    UIColor *startColor;
    UIColor *endColor;
    
    UIView *labelView;
    UILabel *courseID;
    UILabel *section;
    UILabel *location;
    UILabel *startEndTime;
}

@property (nonatomic, retain) UIColor *startColor;
@property (nonatomic, retain) UIColor *endColor;
@property (nonatomic, retain) UIView *labelView;
@property (nonatomic, retain) UILabel *courseID;
@property (nonatomic, retain) UILabel *section;
@property (nonatomic, retain) UILabel *location;
@property (nonatomic, retain) UILabel *startEndTime;

- (id)initWithFrame:(CGRect)frame andCourse:(Course *)course atTime:(Time *)time;
-(void)setDataFromCourse:(Course *)course atTime:(Time *)time;

@end

