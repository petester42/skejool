//
//  ViewSchedulesView'.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-06.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewSchedulesView.h"

@implementation ViewSchedulesView

@synthesize title, scrollView, pageControl, isScrolling;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        isScrolling = NO;
        
        self.backgroundColor = [UIColor clearColor]; 
        
        title = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/2, 12, self.frame.size.width, 30)];
        title.backgroundColor = [UIColor clearColor];
        title.textAlignment = UITextAlignmentCenter;
        title.font = [UIFont fontWithName:BOLD_FONT_NAME size:30];
        title.adjustsFontSizeToFitWidth = YES;
        title.textColor = TEXT_COLOR;
        title.layer.anchorPoint = CGPointMake(1.0,0.5);

        /*  [title.layer setShadowColor:[[UIColor blackColor] CGColor]];
         [title.layer setShadowOffset:CGSizeMake(0, 1)];
         [title.layer setShadowOpacity:0.75];
         [title.layer setShadowRadius:5.0f];
         title.layer.masksToBounds = NO;*/
        
        [self addSubview:title];
        
        int numberOfSchedules = [[[Data sharedInstance] Schedules] count];
        
        pageControl = [[StyledPageControl alloc] initWithFrame:CGRectZero];
        [pageControl setPageControlStyle:PageControlStyleDefault]; 
        [pageControl setCoreNormalColor:MEDIUM_GRAY];
        [pageControl setCoreSelectedColor:DARK_RED];
        [pageControl setHidesForSinglePage:YES];
        [pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
        
        [pageControl setNumberOfPages:numberOfSchedules];
        [pageControl setCurrentPage:0];
        
        if (numberOfSchedules < 2) {
            pageControl.frame = CGRectMake(title.frame.origin.x, title.frame.origin.y + title.frame.size.height-5, title.frame.size.width, 20);
        }
        
        else {
            pageControl.frame = CGRectMake(title.frame.origin.x, title.frame.origin.y + title.frame.size.height-5, title.frame.size.width, 40);
        }
        
        [self addSubview:pageControl];
        
        scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, pageControl.frame.origin.y+pageControl.frame.size.height, viewWidth, frame.size.height - (pageControl.frame.origin.y+pageControl.frame.size.height+10))];
        scrollView.delegate = self;
        scrollView.pagingEnabled = YES;
        scrollView.backgroundColor = [UIColor clearColor];
        scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * numberOfSchedules, scrollView.frame.size.height);
        
        [self addSubview:scrollView];
        
        [self scrollViewDidScroll:scrollView];
        
        [self addSchedules];
    }
    
    return self;
}

-(void)addSchedules{
    
    int numberOfSchedules = [[[Data sharedInstance] Schedules] count];
    
    for (int i = 0; i < numberOfSchedules; ++i) {
        
        TimeTable *timeTable = [[TimeTable alloc] initWithFrame:CGRectMake(i * scrollView.frame.size.width + 10, 0, scrollView.frame.size.width-20, scrollView.frame.size.height)];
        timeTable.selection = NO;
        [timeTable setUpSchedule:[[[Data sharedInstance] Schedules] objectAtIndex:i]];
        
        [scrollView addSubview:timeTable];
        [timeTable release];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)_scrollView{
    
    
    if (isScrolling == NO) {
        
        CGFloat pageWidth = _scrollView.frame.size.width;
        int page = floor((_scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        [pageControl setCurrentPage:page];
        
        if ([[[Data sharedInstance] Schedules] count] == 0) {
            title.text = @"";
        }
        
        else{
            title.text = [[[[Data sharedInstance] Schedules] objectAtIndex:page] semester];
        }
    }
    
    else {
        
    }
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)_scrollView{
    isScrolling = NO;
}

-(void)changePage:(id)sender{
    isScrolling = YES;
    
    int page = pageControl.currentPage;
    
    if ([[[Data sharedInstance] Schedules] count] == 0) {
        title.text = @"";
    }
    
    else{
        title.text = [[[[Data sharedInstance] Schedules] objectAtIndex:page] semester];
    }

    [scrollView scrollRectToVisible:CGRectMake(viewWidth*page, 0, viewWidth,1) animated:YES];
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
