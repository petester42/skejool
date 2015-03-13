//
//  ViewCourseView.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableHeaderView.h"
#import "CourseTableViewCell.h"

@interface ViewCourseView : UIView  <UITableViewDataSource, UITableViewDelegate> {
  
    UITableView *table;
    
}

@property (nonatomic, retain) UITableView *table;

@end
