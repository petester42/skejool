//
//  DetailViewController.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController

@synthesize detailItem;

- (void)dealloc
{
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad]; 
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(getSequenceDone:) 
                                                 name:@"getSequenceRequestDone" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(getCoursesDone:) 
                                                 name:@"getCoursesRequestDone" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(getSchedulesDone:) 
                                                 name:@"getSchedulesRequestDone" object:nil];
    
    
	// Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    detailItem = [[UIView alloc] init];
    detailItem.tag = -1;
    //    [self switchToNoActionAnimated:NO];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"getSequenceRequestDone" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"getCoursesRequestDone" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"getSchedulesRequestDone" object:nil];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return [Helper getInterfaceOrientation:interfaceOrientation];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    
}

-(void)switchToView:(UIView *)newView{
    
#warning may cause views to be on top of each other possibly fixed
    //    NSLog(@"%i",[self.view.subviews count]);
    
    if ([self.view.subviews count] > 1) {
        while ([self.view.subviews count] > 1) {
            [[self.view.subviews objectAtIndex:0] removeFromSuperview];
        }
    }
    
    if(detailItem.tag != newView.tag) {
        
        UIView *theOldView = detailItem;
        theOldView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
        UIView *theNewView = newView;
        theNewView.frame = CGRectMake(viewWidth, 0, viewWidth, viewHeight);
        theNewView.alpha = 0.0;
        theNewView.transform = CGAffineTransformMakeRotation(M_PI);
        
        [self.view addSubview:theNewView];        
        
        [detailItem release]; 
        detailItem = [theNewView retain]; 
        
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             
                             theNewView.frame = CGRectMake(0, 0, viewWidth, viewHeight);
                             theNewView.alpha = 1.0;
                             theNewView.transform = CGAffineTransformMakeRotation(2*M_PI);
                             
                             theOldView.frame = CGRectMake(0, 0, viewWidth, viewHeight);            
                             theOldView.alpha = 0.0;
                             theOldView.transform = CGAffineTransformMakeScale(0.1, 0.1);
                             
                         }
         
                         completion:^ (BOOL finished) {
                             
                             if (finished) {  
                                 
                                 [theOldView removeFromSuperview];
                             }  
                             
                         }];
    }
    
    else {
        
    }
}

-(void)switchToNoActionAnimated:(BOOL)animated{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
    view.tag = 0;
    
    UIImageView *image = [[UIImageView alloc] initWithImage:[Helper getNoActionImage]];
    image.frame = CGRectMake(viewWidth/2 - image.frame.size.width/2, viewHeight/2 - image.frame.size.height/2, image.frame.size.width, image.frame.size.height);
    
    [view addSubview:image];
    [image release];
    
    if (animated == YES) {
        [self switchToView:(id)view];
    }
    
    else {
        if(detailItem.tag != view.tag) {
            
            [detailItem removeFromSuperview];
            self.detailItem = view;    
            [self.view addSubview:view];
        }
    }
    
    [view release];
    
}

-(void)switchToViewSequenceAnimated:(BOOL)animated{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
    view.tag = 1;
    
    ViewSequenceView *viewSequenceView = [[ViewSequenceView alloc] initWithFrame:view.bounds];
    
    [view addSubview:viewSequenceView];
    
    [viewSequenceView release];
    
    if (animated == YES) {
        [self switchToView:(id)view];
    }
    
    else {
        if(detailItem.tag != view.tag) {
           
            [detailItem removeFromSuperview];
            self.detailItem = view;    
            [self.view addSubview:view];
        }
    }
    
    [view release];
}

-(void)switchToViewCoursesAnimated:(BOOL)animated{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
    view.tag = 2;
    
    ViewCourseView *viewCourseView = [[ViewCourseView alloc] initWithFrame:view.bounds];
    
    [view addSubview:viewCourseView];
    
    [viewCourseView release];
    
    if (animated == YES) {
        [self switchToView:(id)view];
    }
    
    else {
        if(detailItem.tag != view.tag) {
            
            [detailItem removeFromSuperview];
            self.detailItem = view;    
            [self.view addSubview:view];
        }
    }
    
    [view release];
}

-(void)switchToViewSchedulesAnimated:(BOOL)animated{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
    view.tag = 3;
    
    ViewSchedulesView *viewSchedulesView = [[ViewSchedulesView alloc] initWithFrame:view.bounds];
    
    [view addSubview:viewSchedulesView];
    
    [viewSchedulesView release];
    
    if (animated == YES) {
        [self switchToView:(id)view];
    }
    
    else {
        if(detailItem.tag != view.tag) {
            
            [detailItem removeFromSuperview];
            self.detailItem = view;    
            [self.view addSubview:view];
        }
    }
    
    [view release];
}

-(void)switchToViewTimeConstraintAnimated:(BOOL)animated{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
    view.tag = 4;
    
    TimeConstraintsView *viewConstraintsView = [[TimeConstraintsView alloc] initWithFrame:view.bounds];
    
    [view addSubview:viewConstraintsView];
    
    [viewConstraintsView release];
    
    if (animated == YES) {
        [self switchToView:(id)view];
    }
    
    else {
        if(detailItem.tag != view.tag) {
            
            [detailItem removeFromSuperview];
            self.detailItem = view;    
            [self.view addSubview:view];
        }
    }
    
    [view release];
}

-(void)switchToViewCreditConstraintAnimated:(BOOL)animated{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
    view.tag = 5;
    
    CreditConstraintsView *viewConstraintsView = [[CreditConstraintsView alloc] initWithFrame:view.bounds];
    
    [view addSubview:viewConstraintsView];
    
    [viewConstraintsView release];
    
    if (animated == YES) {
        [self switchToView:(id)view];
    }
    
    else {
        if(detailItem.tag != view.tag) {
            
            [detailItem removeFromSuperview];
            self.detailItem = view;    
            [self.view addSubview:view];
        }
    }
    
    [view release];
}

-(void)switchToScheduleAnimated:(BOOL)animated withIndex:(id)index{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
    view.tag = 6 + [index intValue];
    
    GeneratedScheduleView *viewConstraintsView = [[GeneratedScheduleView alloc] initWithFrame:view.bounds];
    [viewConstraintsView setIndex:[index intValue]];
    
    [view addSubview:viewConstraintsView];
    
    [viewConstraintsView release];
    
    if (animated == YES) {
        [self switchToView:(id)view];
    }
    
    else {
        if(detailItem.tag != view.tag) {
            
            [detailItem removeFromSuperview];
            self.detailItem = view;    
            [self.view addSubview:view];
        }
    }
    
    [view release];
}

-(void)getSequenceDone:(id)sender{
    [self switchToViewSequenceAnimated:YES];
}

-(void)getCoursesDone:(id)sender{
    [self switchToViewCoursesAnimated:YES];
}

-(void)getSchedulesDone:(id)sender{
    [self switchToViewSchedulesAnimated:YES];
}

-(void)getTimeConstraints:(id)sender{
    [self switchToViewTimeConstraintAnimated:YES];
}

-(void)getCreditConstraints:(id)sender{
    [self switchToViewCreditConstraintAnimated:YES];
}

-(void)getScheduleForIndex:(id)sender{
    [self switchToScheduleAnimated:YES withIndex:sender];
}


@end
