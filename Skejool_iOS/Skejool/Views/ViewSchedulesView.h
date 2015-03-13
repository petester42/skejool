//
//  ViewSchedulesView'.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-06.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StyledPageControl.h"
#import "TimeTable.h"

@interface ViewSchedulesView : UIView <UIScrollViewDelegate>{

    UILabel *title;
    UIScrollView *scrollView;
    StyledPageControl *pageControl;
    BOOL isScrolling;
}

@property (nonatomic, retain) UILabel *title;
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) StyledPageControl *pageControl;
@property (nonatomic) BOOL isScrolling;

-(void)addSchedules;
-(void)changePage:(id)sender;

@end
