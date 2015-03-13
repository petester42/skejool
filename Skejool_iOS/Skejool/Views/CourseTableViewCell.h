//
//  CourseTableViewCell.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"

@interface CourseTableViewCell : UITableViewCell {
    
//    UILabel *courseID;
    UILabel *courseName;
    UILabel *credits;

}

//@property (nonatomic, retain) UILabel *courseID;
@property (nonatomic, retain) UILabel *courseName;
@property (nonatomic, retain) UILabel *credits;

-(void)setUpCell:(Course *)course;

@end
